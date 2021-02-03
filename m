Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73D30D059
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 01:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1604E842A8;
	Wed,  3 Feb 2021 00:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qov90DnM0WoV; Wed,  3 Feb 2021 00:39:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 983B1840B2;
	Wed,  3 Feb 2021 00:39:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF2CC013A;
	Wed,  3 Feb 2021 00:39:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3652C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA13781B21
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vg6pR3kZhVLg for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 00:39:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1CF0D804B5
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 00:39:08 +0000 (UTC)
IronPort-SDR: yeI5RXbeTcrYAlzvSg9kBpoQGT4Q+piWA7ptS3tdHHIZAF3IWpBDRN2ZtIYvS/ULYzh+BrLqei
 mCe2+CkNAoEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="242473136"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="242473136"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 16:39:07 -0800
IronPort-SDR: f308Kp4TYGqdN1tyw7K0eIM7AJym0KHs+cYDzK1wXHHnVW23Ndl/3dkIUSpPYfnWq2tFkd0354
 WuoQGAsbTxWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="406361276"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2021 16:38:22 -0800
Subject: Re: [PATCH 2/3] iommu/vt-d: Parse SATC reporting structure
To: "Raj, Ashok" <ashok.raj@intel.com>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-3-baolu.lu@linux.intel.com>
 <20210202164102.GD39643@otc-nc-03>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <28583efc-1a3a-a863-fb68-cfe3afa9d68a@linux.intel.com>
Date: Wed, 3 Feb 2021 08:29:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202164102.GD39643@otc-nc-03>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Ashok,

On 2/3/21 12:41 AM, Raj, Ashok wrote:
> On Tue, Feb 02, 2021 at 12:40:56PM +0800, Lu Baolu wrote:
>> From: Yian Chen <yian.chen@intel.com>
>>
>> Software should parse every SATC table and all devices in the tables
>> reported by the BIOS and keep the information in kernel list for further
>> SATC policy deployment.
>>
> The last part seems bit vague? Are you trying to imply,
> 
> if kernel is booted with noats for instance, a device listed in SATC table
> as "requires ATS" will fail to load?
> 
> Otherwise its not clear what the policy enforcement means.
> 

Yes. This is a bit vague. The ATS policy is out of the purpose of this
patch. It only parses the table and keep the device list for further
reference.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
