Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D881E584B
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 09:15:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9FF0C86F7D;
	Thu, 28 May 2020 07:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgRjsafCiTkg; Thu, 28 May 2020 07:15:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5C3EF86F72;
	Thu, 28 May 2020 07:15:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47F60C016F;
	Thu, 28 May 2020 07:15:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD7F2C016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 07:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BA10688870
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 07:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPPWEv9UUU00 for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 07:14:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 41FAE8886C
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 07:14:59 +0000 (UTC)
IronPort-SDR: bz6QO0S3Gy42i/iSJdoEzId6dwEzP1uIopeKZmTiSdTwXAKuVF7EuSe9FpBEnTbTO1xPgn2KTl
 ANKDWe16+UyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 00:14:58 -0700
IronPort-SDR: iQKMIY9FYMhJzjvuXKfBJnke/aonbJBD0wTMyrY0H5ucO+pQBfNmMjUfqONvHJtWUESPWecEcH
 v4PgGBXtREHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="442848653"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.30.232])
 ([10.255.30.232])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2020 00:14:56 -0700
Subject: Re: [PATCH v1 2/3] iommu/vt-d: Allocate domain info for real DMA
 sub-devices
To: Jon Derrick <jonathan.derrick@intel.com>, iommu@lists.linux-foundation.org
References: <20200527165617.297470-1-jonathan.derrick@intel.com>
 <20200527165617.297470-3-jonathan.derrick@intel.com>
 <fd4b5313-efd0-90bf-5841-80a97ce5f652@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <39342c83-8484-5a42-f16e-fe3cda67c809@linux.intel.com>
Date: Thu, 28 May 2020 15:14:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <fd4b5313-efd0-90bf-5841-80a97ce5f652@linux.intel.com>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org
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

On 2020/5/28 15:01, Lu Baolu wrote:
> On 2020/5/28 0:56, Jon Derrick wrote:
>> Sub-devices of a real DMA device might exist on a separate segment than
>> the real DMA device and its IOMMU. These devices should still have a
>> valid device_domain_info, but the current dma alias model won't
>> allocate info for the subdevice.
>>
>> This patch adds a segment member to struct device_domain_info and uses
>> the sub-device's BDF so that these sub-devices won't alias to other
>> devices.
>>
>> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> 
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

And a fix tag, so that it could be picked up for v5.6+ stable kernel.

Fixes: 2b0140c69637e ("iommu/vt-d: Use pci_real_dma_dev() for mapping")

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
