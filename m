Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC6219538
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 02:37:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2A44897BC;
	Thu,  9 Jul 2020 00:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSYiik2TiXol; Thu,  9 Jul 2020 00:37:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1050897B6;
	Thu,  9 Jul 2020 00:37:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD2FAC016F;
	Thu,  9 Jul 2020 00:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5ABCC016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9E23588B59
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJrGQaE087E6 for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 00:37:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AFD7188B0F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:37:29 +0000 (UTC)
IronPort-SDR: R6lUQe5h7IHrMS363aB27KTz7U1YYDCIwIjla5sxtN3m7Ijopc10xKF0NmALdU0Qn6zZzeEwMW
 g4CFDt5LJLHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="209448900"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="209448900"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 17:37:29 -0700
IronPort-SDR: FRSukxGomovbvLa/bRUaRvnnXnpt2T8oghk5I2Q2/bRGibcNSRUvQ+t0rKsm7aBw6jbGSs1PTb
 KnL/RnMXHtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="457699458"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga005.jf.intel.com with ESMTP; 08 Jul 2020 17:37:27 -0700
Subject: Re: [PATCH v2 4/4] iommu/vt-d: Add page response ops support
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20200706002535.9381-1-baolu.lu@linux.intel.com>
 <20200706002535.9381-5-baolu.lu@linux.intel.com>
 <MWHPR11MB1645D608AF261AA7DE8FF6CE8C690@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1a8af358-80bb-3a92-3a26-906276bb772d@linux.intel.com>
Date: Thu, 9 Jul 2020 08:32:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1645D608AF261AA7DE8FF6CE8C690@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raj,
 Ashok" <ashok.raj@intel.com>
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

On 7/6/20 9:47 AM, Tian, Kevin wrote:
>> From: Lu Baolu
>> Sent: Monday, July 6, 2020 8:26 AM
>>
>> After a page request is handled, software must response the device which
>> raised the page request with the handling result. This is done through
> 
> 'response' is a noun.

Yes.

> 
>> the iommu ops.page_response if the request was reported to outside of
>> vendor iommu driver through iommu_report_device_fault(). This adds the
>> VT-d implementation of page_response ops.
>>
>> Co-developed-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Co-developed-by: Liu Yi L <yi.l.liu@intel.com>
>> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c |  1 +
>>   drivers/iommu/intel/svm.c   | 74
>> +++++++++++++++++++++++++++++++++++++
>>   include/linux/intel-iommu.h |  3 ++
>>   3 files changed, 78 insertions(+)
>>
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index de17952ed133..7eb29167e8f9 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -6057,6 +6057,7 @@ const struct iommu_ops intel_iommu_ops = {
>>   	.sva_bind		= intel_svm_bind,
>>   	.sva_unbind		= intel_svm_unbind,
>>   	.sva_get_pasid		= intel_svm_get_pasid,
>> +	.page_response		= intel_svm_page_response,
>>   #endif
>>   };
>>
>> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
>> index 08c58c2b1a06..1c7d8a9ea124 100644
>> --- a/drivers/iommu/intel/svm.c
>> +++ b/drivers/iommu/intel/svm.c
>> @@ -1078,3 +1078,77 @@ int intel_svm_get_pasid(struct iommu_sva *sva)
>>
>>   	return pasid;
>>   }
>> +
>> +int intel_svm_page_response(struct device *dev,
>> +			    struct iommu_fault_event *evt,
>> +			    struct iommu_page_response *msg)
>> +{
>> +	struct iommu_fault_page_request *prm;
>> +	struct intel_svm_dev *sdev;
>> +	struct intel_iommu *iommu;
>> +	struct intel_svm *svm;
>> +	bool private_present;
>> +	bool pasid_present;
>> +	bool last_page;
>> +	u8 bus, devfn;
>> +	int ret = 0;
>> +	u16 sid;
>> +
>> +	if (!dev || !dev_is_pci(dev))
>> +		return -ENODEV;
> 
> but we didn't do same check when reporting fault?

For now, we only support PCI devices, so I will add this check in report
as well.

> 
>> +
>> +	iommu = device_to_iommu(dev, &bus, &devfn);
>> +	if (!iommu)
>> +		return -ENODEV;
>> +
>> +	if (!msg || !evt)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&pasid_mutex);
>> +
>> +	prm = &evt->fault.prm;
>> +	sid = PCI_DEVID(bus, devfn);
>> +	pasid_present = prm->flags &
>> IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
>> +	private_present = prm->flags &
>> IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA;
>> +	last_page = prm->flags &
>> IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
>> +
>> +	if (pasid_present) {
>> +		if (prm->pasid == 0 || prm->pasid >= PASID_MAX) {
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +
>> +		ret = pasid_to_svm_sdev(dev, prm->pasid, &svm, &sdev);
>> +		if (ret || !sdev) {
>> +			ret = -ENODEV;
>> +			goto out;
>> +		}
>> +	}
> 
> what about pasid_present==0? Do we support recoverable fault now
> with this patch?

For now, we don't support reporting a prq without pasid to outside.
prq_event_thread() handles such requests explicitly. I will add a
check in response ops.

> 
> and who guarantees that the external fault handler (e.g. guest)
> cannot do bad thing with this interface, e.g. by specifying a PASID
> belonging to other guests (when Scalable IOV is enabled)?

I will check below if the response is from user space.

(svm->mm ==  get_task_mm(current))

> 
> Thanks
> Kevin

Best regards,
baolu

>> +
>> +	/*
>> +	 * Per VT-d spec. v3.0 ch7.7, system software must respond
>> +	 * with page group response if private data is present (PDP)
>> +	 * or last page in group (LPIG) bit is set. This is an
>> +	 * additional VT-d requirement beyond PCI ATS spec.
>> +	 */
>> +	if (last_page || private_present) {
>> +		struct qi_desc desc;
>> +
>> +		desc.qw0 = QI_PGRP_PASID(prm->pasid) | QI_PGRP_DID(sid)
>> |
>> +				QI_PGRP_PASID_P(pasid_present) |
>> +				QI_PGRP_PDP(private_present) |
>> +				QI_PGRP_RESP_CODE(msg->code) |
>> +				QI_PGRP_RESP_TYPE;
>> +		desc.qw1 = QI_PGRP_IDX(prm->grpid) |
>> QI_PGRP_LPIG(last_page);
>> +		desc.qw2 = 0;
>> +		desc.qw3 = 0;
>> +		if (private_present)
>> +			memcpy(&desc.qw2, prm->private_data,
>> +			       sizeof(prm->private_data));
>> +
>> +		qi_submit_sync(iommu, &desc, 1, 0);
>> +	}
>> +out:
>> +	mutex_unlock(&pasid_mutex);
>> +	return ret;
>> +}
>> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
>> index fc2cfc3db6e1..bf6009a344f5 100644
>> --- a/include/linux/intel-iommu.h
>> +++ b/include/linux/intel-iommu.h
>> @@ -741,6 +741,9 @@ struct iommu_sva *intel_svm_bind(struct device
>> *dev, struct mm_struct *mm,
>>   				 void *drvdata);
>>   void intel_svm_unbind(struct iommu_sva *handle);
>>   int intel_svm_get_pasid(struct iommu_sva *handle);
>> +int intel_svm_page_response(struct device *dev, struct iommu_fault_event
>> *evt,
>> +			    struct iommu_page_response *msg);
>> +
>>   struct svm_dev_ops;
>>
>>   struct intel_svm_dev {
>> --
>> 2.17.1
>>
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
