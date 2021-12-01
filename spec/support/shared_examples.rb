shared_examples_for 'call_communicator' do
  it 'call communicator' do

    if communicator_with
      expect(communicator)
        .to receive(http_method)
        .with(path, *communicator_with)
        .and_return(response)
    else
      expect(communicator)
        .to receive(http_method)
        .with(path)
        .and_return(response)
    end

    result = subject.send(method, *subject_send_with)
    expect(result).to eq(response)
  end
end

shared_examples_for 'send_receive' do
  it 'gets response' do
    expect(web_consumer)
      .to receive(method)
      .with('some_service_url/some_path', request_body)
      .and_return(response)

    result = subject.send(method, *params)
    expect(result).to be(response)
  end
end
