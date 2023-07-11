
# Create coordinators
coordinators = [
  { name: 'Prakash Chaudhary', email: 'chaudharyprakash1992@gmail.com', phone_number: '9662402742' },
  { name: 'Test', email: 'test@gmail.com', phone_number: '12334556666' }
]

coordinators.each do |coordinator_attributes|
  Coordinator.create!(coordinator_attributes)
end

# Create registries
registries = [
  { name: 'Registry 1', location: 'Location 1', state: 0 },
  { name: 'Registry 2', location: 'Location 2', state: 1 }
]

registries.each do |registry_attributes|
  Registry.create!(registry_attributes)
end

# Create participants
participants = [
  { name: 'Participant 1', gender: 'Male', date_of_birth: Date.new(1990, 1, 1) },
  { name: 'Participant 2', gender: 'Female', date_of_birth: Date.new(1995, 5, 10) },
  { name: 'Participant 3', gender: 'Male', date_of_birth: Date.new(2000, 8, 20) }
]

participants.each do |participant_attributes|
  Participant.create!(participant_attributes)
end

# Create enrollments
enrollments = [
  { participant: Participant.first, registry: Registry.first, coordinator: Coordinator.first, date_of_enrollment: Date.today, method_of_contact: 'phone', remarks: 'Enrollment 1' },
  { participant: Participant.first, registry: Registry.second, coordinator: Coordinator.second, date_of_enrollment: Date.today, method_of_contact: 'email', remarks: 'Enrollment 2' },
  { participant: Participant.second, registry: Registry.first, coordinator: Coordinator.first, date_of_enrollment: Date.today, method_of_contact: 'phone', remarks: 'Enrollment 3' }
]

enrollments.each do |enrollment_attributes|
  Enrollment.create!(enrollment_attributes)
end