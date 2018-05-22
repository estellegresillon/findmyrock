class BandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #scope c'est Band
    end
  end

  def show?
    true #Tous les users peuvent voir tous les bands
  end

  def create?
    true #Tous les users peuvent creer des bands
  end

  def update?
    # Seul le owner peut le modifier
   true
  end

  def destroy?
    true
  end
end
