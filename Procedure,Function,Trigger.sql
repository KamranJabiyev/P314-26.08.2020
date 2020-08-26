use P314

select * from Students
where Grade>80

create procedure usp_GetStudentGrade @Grade int
as
select * from Students
where Grade>@Grade

exec usp_GetStudentGrade 50

exec usp_GetStudentGrade 70

exec usp_GetStudentGrade 80

create procedure usp_GetStudentGradeAge (@Grade int,@Age int)
as
select * from Students
where Grade>@Grade AND Age>@Age

exec usp_GetStudentGradeAge 70,20


create procedure usp_GetStudentGradeAgeDefaultVal (@Grade int=50,@Age int)
as
select * from Students
where Grade>@Grade AND Age>@Age


exec usp_GetStudentGradeAgeDefaultVal @Age=20

exec usp_GetStudentGradeAgeDefaultVal 70,20

select Count(Firstname) from Students
where Grade>70

create function getStudentCountWithGrade(@Grade int)
returns int
as
begin
	declare @Count int
	select @Count=Count(Firstname) from Students where Grade>@Grade
	return @Count
end

select dbo.getStudentCountWithGrade(0)


create trigger ShowInfoAfterDeleteProduct
on Product
after delete
as
begin
	print 'Bir data silindi'
end


delete from Product where Id=7

insert into Product values('jilet2')


create trigger ShowAllDataFromProductAfterInsert
on Product
after insert
as
begin
	Select * from Product
end

create table CopyProduct(
	Id int,
	Name nvarchar(100)
)

create trigger CopyProductData
on Product
after insert
as
begin
	declare @Id int
	declare @Name nvarchar(100)

	Select @Id=ProductList.Id,@Name=ProductList.Name from inserted ProductList
	insert into CopyProduct values(@Id,@Name)
end

insert into Product values('TestCopy')

