Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A14E413F
	for <lists.iommu@lfdr.de>; Fri, 25 Oct 2019 03:46:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0713BCB5;
	Fri, 25 Oct 2019 01:46:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C804AC9E
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 01:46:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 64FD487E
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 01:46:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2019 18:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,226,1569308400"; d="scan'208";a="197896687"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2019 18:46:35 -0700
Subject: Re: [PATCH v6 02/10] iommu/vt-d: Add custom allocator for IOASID
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1571788403-42095-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571788403-42095-3-git-send-email-jacob.jun.pan@linux.intel.com>
	<20191023005129.GC100970@otc-nc-03>
	<0a0f33b8-e3d8-3d29-ca71-552f1875bc62@linux.intel.com>
	<20191023160152.07305918@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <85d806c3-0378-5f09-85fe-5c8f83c87c5f@linux.intel.com>
Date: Fri, 25 Oct 2019 09:44:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023160152.07305918@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>, "Raj,
	Ashok" <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 10/24/19 7:01 AM, Jacob Pan wrote:
> On Wed, 23 Oct 2019 10:21:51 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>>>> +#ifdef CONFIG_INTEL_IOMMU_SVM
>>>
>>> Maybe move them to intel-svm.c instead? that's where the bulk
>>> of the svm support is?
>>
>> I think this is a generic PASID allocator for guest IOMMU although
>> vSVA is currently the only consumer. Instead of making it SVM
>> specific, I'd like to suggest moving it to intel-pasid.c and replace
>> the @svm parameter with a void * one in intel_ioasid_free().
> 
> make sense to use void*, no need to tie that to svm bind data type.
> 
> In terms of location, perhaps we can move if we have more consumers of
> custom allocator?
> 

Make sense to me.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
