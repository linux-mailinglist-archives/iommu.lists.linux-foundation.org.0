Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AC528210213
	for <lists.iommu@lfdr.de>; Wed,  1 Jul 2020 04:31:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A394876EC;
	Wed,  1 Jul 2020 02:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHV1G14R_Fj4; Wed,  1 Jul 2020 02:31:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98A14876AB;
	Wed,  1 Jul 2020 02:31:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79FB9C016E;
	Wed,  1 Jul 2020 02:31:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99E2DC016E
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 02:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 822F2876EC
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 02:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jd3rQQbECOeF for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 02:31:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8163F876AB
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 02:31:48 +0000 (UTC)
IronPort-SDR: hY2QMJCoPAaN8+3eevRA2H2LjMjwUCN8ruYDaCdNd6JMv5CWfaECiGqALrVekCLz6Dl1O4/VA4
 wvANEfQSCWvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="134731761"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="134731761"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 19:31:47 -0700
IronPort-SDR: hueeM/Xkc1UeeVZCt3X7WtSxlqWhu3CrnIFVzc/QUvObfntkVQzWdJz4sL0ASrt2tcRdKlpK1R
 z/Iq4S+VBoSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="265275739"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2020 19:31:45 -0700
Subject: Re: [PATCH 3/4] iommu/vt-d: Report page request faults for guest SVA
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20200628003332.5720-1-baolu.lu@linux.intel.com>
 <20200628003332.5720-4-baolu.lu@linux.intel.com>
 <MWHPR11MB16450BD48B3EF42A8E82E5698C6F0@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <bbc13eab-5475-1827-2841-6d9024362d65@linux.intel.com>
Date: Wed, 1 Jul 2020 10:27:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB16450BD48B3EF42A8E82E5698C6F0@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Kevin,

Thanks a lot for reviewing my patches.

On 6/30/20 2:01 PM, Tian, Kevin wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>> Sent: Sunday, June 28, 2020 8:34 AM
>>
>> A pasid might be bound to a page table from a VM guest via the iommu
>> ops.sva_bind_gpasid. In this case, when a DMA page fault is detected
>> on the physical IOMMU, we need to inject the page fault request into
>> the guest. After the guest completes handling the page fault, a page
>> response need to be sent back via the iommu ops.page_response().
>>
>> This adds support to report a page request fault. Any external module
>> which is interested in handling this fault should regiester a notifier
>> callback.
>>
>> Co-developed-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Co-developed-by: Liu Yi L <yi.l.liu@intel.com>
>> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/svm.c | 83
>> +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 80 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
>> index c23167877b2b..4800bb6f8794 100644
>> --- a/drivers/iommu/intel/svm.c
>> +++ b/drivers/iommu/intel/svm.c
>> @@ -815,6 +815,69 @@ static void intel_svm_drain_prq(struct device *dev,
>> int pasid)
>>   	}
>>   }
>>
>> +static int prq_to_iommu_prot(struct page_req_dsc *req)
>> +{
>> +	int prot = 0;
>> +
>> +	if (req->rd_req)
>> +		prot |= IOMMU_FAULT_PERM_READ;
>> +	if (req->wr_req)
>> +		prot |= IOMMU_FAULT_PERM_WRITE;
>> +	if (req->exe_req)
>> +		prot |= IOMMU_FAULT_PERM_EXEC;
>> +	if (req->pm_req)
>> +		prot |= IOMMU_FAULT_PERM_PRIV;
>> +
>> +	return prot;
>> +}
>> +
>> +static int
>> +intel_svm_prq_report(struct intel_iommu *iommu, struct page_req_dsc
>> *desc)
>> +{
>> +	struct iommu_fault_event event;
>> +	struct pci_dev *pdev;
>> +	u8 bus, devfn;
>> +	int ret = 0;
>> +
>> +	memset(&event, 0, sizeof(struct iommu_fault_event));
>> +	bus = PCI_BUS_NUM(desc->rid);
>> +	devfn = desc->rid & 0xff;
>> +	pdev = pci_get_domain_bus_and_slot(iommu->segment, bus, devfn);
> 
> Is this step necessary? dev can be passed in (based on sdev), and more
> importantly iommu_report_device_fault already handles the ref counting
> e.g. get_device(dev) when fault handler is valid...

Yes, agreed. I will pass device in instead.

> 
>> +
>> +	if (!pdev) {
>> +		pr_err("No PCI device found for PRQ [%02x:%02x.%d]\n",
>> +		       bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Fill in event data for device specific processing */
>> +	event.fault.type = IOMMU_FAULT_PAGE_REQ;
>> +	event.fault.prm.addr = desc->addr;
>> +	event.fault.prm.pasid = desc->pasid;
>> +	event.fault.prm.grpid = desc->prg_index;
>> +	event.fault.prm.perm = prq_to_iommu_prot(desc);
>> +
>> +	/*
>> +	 * Set last page in group bit if private data is present,
>> +	 * page response is required as it does for LPIG.
>> +	 */
>> +	if (desc->lpig)
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
>> +	if (desc->pasid_present)
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
>> +	if (desc->priv_data_present) {
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
> 
> why setting lpig under this condition?

/*
  * Per VT-d spec. v3.0 ch7.7, system software must
  * respond with page group response if private data
  * is present (PDP) or last page in group (LPIG) bit
  * is set. This is an additional VT-d feature beyond
  * PCI ATS spec.
  */

> 
>> +		event.fault.prm.flags |=
>> IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA;
>> +		memcpy(event.fault.prm.private_data, desc->priv_data,
>> +		       sizeof(desc->priv_data));
>> +	}
>> +
>> +	ret = iommu_report_device_fault(&pdev->dev, &event);
>> +	pci_dev_put(pdev);
>> +
>> +	return ret;
>> +}
>> +
>>   static irqreturn_t prq_event_thread(int irq, void *d)
>>   {
>>   	struct intel_iommu *iommu = d;
>> @@ -874,6 +937,19 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   		if (!is_canonical_address(address))
>>   			goto bad_req;
>>
>> +		/*
>> +		 * If prq is to be handled outside iommu driver via receiver of
>> +		 * the fault notifiers, we skip the page response here.
>> +		 */
>> +		if (svm->flags & SVM_FLAG_GUEST_MODE) {
>> +			int res = intel_svm_prq_report(iommu, req);
>> +
>> +			if (!res)
>> +				goto prq_advance;
>> +			else
>> +				goto bad_req;
>> +		}
>> +
> 
> I noted in bad_req there is another reporting logic:
> 
>                  if (sdev && sdev->ops && sdev->ops->fault_cb) {
>                          int rwxp = (req->rd_req << 3) | (req->wr_req << 2) |
>                                  (req->exe_req << 1) | (req->pm_req);
>                          sdev->ops->fault_cb(sdev->dev, req->pasid, req->addr,
>                                              req->priv_data, rwxp, result);
>                  }
> 
> It was introduced in the 1st version of svm.c. It might be unrelated to
> this patch, but I wonder whether that one should be replaced with
> iommu_report_device_fault too?

This call back will be deprecated. The previous api in generic iommu has
been removed.

https://www.spinics.net/lists/iommu/msg43657.html

I will make it in a separated patch.

> 
> Thanks
> Kevin

Best regards,
baolu

> 
>>   		/* If the mm is already defunct, don't handle faults. */
>>   		if (!mmget_not_zero(svm->mm))
>>   			goto bad_req;
>> @@ -892,10 +968,10 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   			goto invalid;
>>
>>   		result = QI_RESP_SUCCESS;
>> -	invalid:
>> +invalid:
>>   		mmap_read_unlock(svm->mm);
>>   		mmput(svm->mm);
>> -	bad_req:
>> +bad_req:
>>   		/* Accounting for major/minor faults? */
>>   		rcu_read_lock();
>>   		list_for_each_entry_rcu(sdev, &svm->devs, list) {
>> @@ -920,7 +996,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   		   and these can be NULL. Do not use them below this point!
>> */
>>   		sdev = NULL;
>>   		svm = NULL;
>> -	no_pasid:
>> +no_pasid:
>>   		if (req->lpig || req->priv_data_present) {
>>   			/*
>>   			 * Per VT-d spec. v3.0 ch7.7, system software must
>> @@ -945,6 +1021,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>>   			resp.qw3 = 0;
>>   			qi_submit_sync(iommu, &resp, 1, 0);
>>   		}
>> +prq_advance:
>>   		head = (head + sizeof(*req)) & PRQ_RING_MASK;
>>   	}
>>
>> --
>> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
