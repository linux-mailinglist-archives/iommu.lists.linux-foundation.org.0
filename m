Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3430D06
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 13:06:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 091221018;
	Fri, 31 May 2019 11:06:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 300ACFFC
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 11:05:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1CCC981A
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 11:05:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6DE0341;
	Fri, 31 May 2019 04:05:41 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EC033F59C;
	Fri, 31 May 2019 04:05:40 -0700 (PDT)
Subject: Re: [PATCH 4/4] iommu: Add recoverable fault reporting
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190523180613.55049-1-jean-philippe.brucker@arm.com>
	<20190523180613.55049-5-jean-philippe.brucker@arm.com>
	<20190524111444.676a4df1@jacob-builder>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <9df2db3b-3892-f4ae-c7de-dbb27a12b293@arm.com>
Date: Fri, 31 May 2019 12:05:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524111444.676a4df1@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: yi.l.liu@linux.intel.com, alex.williamson@redhat.com, ashok.raj@intel.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 24/05/2019 19:14, Jacob Pan wrote:
> On Thu, 23 May 2019 19:06:13 +0100
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index d546f7baa0d4..b09b3707f0e4 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -872,7 +872,14 @@
>> EXPORT_SYMBOL_GPL(iommu_group_unregister_notifier);
>>   * @data: private data passed as argument to the handler
>>   *
>>   * When an IOMMU fault event is received, this handler gets called
>> with the
>> - * fault event and data as argument. The handler should return 0 on
>> success.
>> + * fault event and data as argument. The handler should return 0 on
>> success. If
>> + * the fault is recoverable (IOMMU_FAULT_PAGE_REQ), the handler
>> should also
>> + * complete the fault by calling iommu_page_response() with one of
>> the following
> nit, in case of injecting into the guest, handler does not have to call
> iommu_page_response() directly.

True, I'll think of a better wording. Maybe just s/handler/consumer/
although we didn't define consumer anywhere


>> IOMMU_PAGE_RESP_PASID_VALID : 0; +
>> +		ret = domain->ops->page_response(dev, msg,
>> evt->iommu_private);
> I guess here you could drop iommu_private in favor of prm such that
> drivers such as vt-d can recover private data as needed?

Yes, will change this

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
