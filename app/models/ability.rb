class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    #cannot :manage, :all
    can :manage, :all

    #if user.role?('loader')
    #  can [:read, :create, :update], [Bill]
    #  can [:read], [Invoice]
    #  can [:menu_warehouse, :menu_bills, :menu_invoices], User
    #  can [:all_contragents], Invoice
    #  cannot [:close, :reopen, :price], :all
    #end
    #if user.role?('manager')
    #  can [:menu_warehouse, :menu_bills, :menu_invoices, :menu_reports, :menu_cash], User
    #  can :manage, [Bill, Contragent, ReportContragent, ReportSog, Store]
    #  cannot [:create, :edit, :destroy], [User, Product, Productgroup, Internalinvoice, Kassainorder, Kassaoutorder, Salary, Invoice]
    #  cannot [:destroy], [Bill, Invoice, Pinvoice, Kassainorder, Kassaoutorder, Advance, Contragent]
    #  cannot [:all_contragents], [Bill, Invoice]
    #  cannot [:manage], [ReportSog, :vedvendor, :actvendor]
    #  can :read, [User, Warehouse, Filial, Product, Productgroup]
    #  cannot [:close, :reopen, :history, :seen, :price], :all
    #end
    #if user.role?('operator')
    #  can [:menu_warehouse, :menu_bills, :menu_invoices, :menu_reports, :menu_cash], User
    #  can [:create, :edit, :read], [Kassainorder, Kassaoutorder ]
    #  cannot [:destroy], [Bill, Invoice, Pinvoice, Advance]
    #  cannot [:manage], [ReportFinresult, Hozoper]
    #  can :read, [Document, Operation, Accountplan, PurchaseType, User, Contragent, Role, Warehouse, Filial]
    #  cannot [:history, :seen, :price], :all
    #end
    #if user.role?('buh')
    #  can :manage, :all
    #  cannot :manage, [Document, Operation, Accountplan, PurchaseType, Contragent, Role, Warehouse, Filial, ReportFinresult]
    #  cannot [:create, :edit, :destroy], [User, Salary, Product, Productgroup, Internalinvoice, Outact]
    #  cannot [:destroy], [Bill, Invoice, Pinvoice, Advance]
    #  cannot [:edit, :destroy], [Kassainorder, Kassaoutorder]
    #  can :read, [Document, Operation, Accountplan, PurchaseType, User, Contragent, Role, Warehouse, Filial]
    #  can [:read, :create], [Kassainorder, Kassaoutorder]
    #  cannot [:history, :seen, :price], :all
    #end
    #if user.role?('uprav')
    #  can :manage, :all
    #  cannot :manage, [Document, Operation, Accountplan, PurchaseType, Contragent, Role, Warehouse, Filial, ReportFinresult]
    #  cannot [:create, :edit, :destroy], [User, Salary, Product, Productgroup, Outact]
    #  cannot [:destroy], [Bill, Invoice, Pinvoice, Advance]
    #  cannot [:edit, :destroy], [Kassainorder, Kassaoutorder]
    #  cannot [:manage], [ReportFinresult, Hozoper]
    #  cannot [:manage], [ReportSog, :vedvendor, :actvendor]
    #  can :read, [Contragent, Warehouse, Filial]
    #  can [:read, :create], [Kassainorder, Kassaoutorder]
    #  cannot [:history, :seen, :price], :all
    #end
    #if user.role?('admin_zam')
    #  can :manage, :all
    #  cannot :manage, [Document, Operation, Accountplan, PurchaseType, ReportFinresult]
    #  cannot [:create, :edit, :destroy], [Outact]
    #  can :read, [Document, Operation, Accountplan, PurchaseType]
    #  cannot [:history, :seen, :price], :all
    #  cannot [:reopen], [Kassainorder]
    #  cannot [:destroy], :all
    #end
    #if user.role?('admin')
    #  can :manage, :all
    #  cannot :manage, [Document, Operation, Accountplan, PurchaseType]
    #  can :read, [Document, Operation, Accountplan, PurchaseType]
    #end
    #if user.role?('admin_small')
    #  can :manage, :all
    #  cannot :manage, [Document, Operation, Accountplan, PurchaseType, Product]
    #  can :read, [Document, Operation, Accountplan, PurchaseType]
    #  cannot [:manage], [ReportFinresult]
    #  cannot [:create, :edit, :destroy], [Internalinvoice]
    #  cannot [:destroy], [Bill, Invoice, Pinvoice, Kassainorder, Kassaoutorder, Advance]
    #  cannot [:reopen], [Kassainorder]
    #  cannot [:history, :seen, :price], :all
    #end
    #if user.role?('developer')
    #  can :manage, :all
    #  #cannot [:history, :seen], :all
    #end
    ##
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
