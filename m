Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D0E7E87
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 03:25:23 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F771EDF;
	Tue, 29 Oct 2019 02:25:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 97975E1E
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 02:25:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 38DC042D
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 02:25:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 19:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,242,1569308400"; d="scan'208";a="224826095"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2019 19:25:15 -0700
Subject: Re: [PATCH v7 03/11] iommu/vt-d: Add custom allocator for IOASID
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	"Tian, Kevin" <kevin.tian@intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-4-git-send-email-jacob.jun.pan@linux.intel.com>
	<ae437be4-e633-e670-0e1f-d07b4364f651@linux.intel.com>
	<20191024214311.43d76a5c@jacob-builder>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D5CDC60@SHSMSX104.ccr.corp.intel.com>
	<e950cde8-8cd9-6089-c833-23d2ffb539d1@linux.intel.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D5D0FF0@SHSMSX104.ccr.corp.intel.com>
	<20191028154900.0be0a48f@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0d8bd9c3-4e01-ab12-8671-ff25a4821ed7@linux.intel.com>
Date: Tue, 29 Oct 2019 10:22:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028154900.0be0a48f@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
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

On 10/29/19 6:49 AM, Jacob Pan wrote:
>>>> I'm not sure whether tying above logic to SVA is the right
>>>> approach. If vcmd interface doesn't work, the whole SM mode
>>>> doesn't make sense which is based on PASID-granular protection
>>>> (SVA is only one usage atop). If the only remaining usage of SM
>>>> is to map gIOVA using reserved PASID#0, then why not disabling SM
>>>> and just fallback to legacy mode?
>>>>
>>>> Based on that I prefer to disabling the SM mode completely (better
>>>> through an interface), and move the logic out of CONFIG_INTEL_
>>>> IOMMU_SVM
>>>>   
>>> Unfortunately, it is dangerous to disable SM after boot. SM uses
>>> different root/device contexts and pasid table formats. Disabling SM
>>> after boot requires changing above from SM format into legacy
>>> format.
>> You are correct.
>>
>>> Since ioasid registration failure is a rare case. How about moving
>>> this part of code up to the early stage of intel_iommu_init() and
>>> returning error if hardware present vcmd capability but software
>>> fails to register a custom ioasid allocator?
>>>    
>> It makes sense to me.
>>
> sounds good to me too, the earlier the less to clean up.

Actually, we even could return error directly and abort the iommu
initialization. The registration of custom ioasid allocator fails only
when memory runs out or software is buggy. In either cases, we should
abort iommu initialization.

Best regards,
baolu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
