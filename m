Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90421955C
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 02:50:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB98F87D30;
	Thu,  9 Jul 2020 00:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxFva9S8twhM; Thu,  9 Jul 2020 00:50:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A6F187D22;
	Thu,  9 Jul 2020 00:50:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D22DC016F;
	Thu,  9 Jul 2020 00:50:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A8ADC016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1468987801
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DFNG-I8yKSK for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 00:49:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B2BC087781
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:49:07 +0000 (UTC)
IronPort-SDR: tBGUZVLrtkGpinJz9SbVl5kP7JT1mQwcEhsRMDebwM/8GCr690RMU4sW83rHRy4kOMl9A6xLnu
 IVegHPyr/IBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="232795791"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="232795791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 17:49:06 -0700
IronPort-SDR: MsuP/jCn6yqWaqU9WMjnXNhTSD5xPOd5WBWLnLNdLcb2O4yzysFZWViMMGBEHLuFidFNATE9Y+
 TIXsXxB6u2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="457701959"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga005.jf.intel.com with ESMTP; 08 Jul 2020 17:49:03 -0700
Subject: Re: [PATCH v4 1/5] docs: IOMMU user API
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1594165429-20075-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594165429-20075-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <6d01dac0-aa9d-e22b-9baf-28c2f538871a@linux.intel.com>
 <20200708082905.1b5da847@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3777718a-9984-f9a5-5ab3-7f5e5782c148@linux.intel.com>
Date: Thu, 9 Jul 2020 08:44:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708082905.1b5da847@jacob-builder>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Jacob,

On 7/8/20 11:29 PM, Jacob Pan wrote:
> On Wed, 8 Jul 2020 10:07:13 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> Hi,
>>
>> On 7/8/20 7:43 AM, Jacob Pan wrote:
>>> +For UAPIs that are shared with in-kernel users, a wrapper function
>>> +is provided to distinguish the callers. For example,
>>> +
>>> +Userspace caller ::
>>> +
>>> +  int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct
>>> device *dev,
>>> +  void __user *udata)
>>> +
>>> +In-kernel caller ::
>>> +
>>> +  int __iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>>> struct device *dev,
>>> +  struct iommu_gpasid_bind_data *data)
>>
>> iommu_page_response() may have the same needs. Can we reach an
>> agreement on the naming rules?
>>
> Yes iommu_page_response() also has to deal with in-kernel and UAPI
> callers. I left it out because I thought the current VFIO and SVA common
> code is not ready for PRQ yet, I might be reading old news :) argsz
> need to be handled as well.
> 
> Perhaps we can wait until this set is settled? Do you have a suggestion
> on the naming rules?

I have no suggestion on the naming rules, just wanted to check whether
others have any preference. I agree that we can wait until this series
is settled.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
