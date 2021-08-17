Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B393EECBD
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 14:49:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E89640533;
	Tue, 17 Aug 2021 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URZvIGwVX9pV; Tue, 17 Aug 2021 12:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8B1DC40530;
	Tue, 17 Aug 2021 12:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C1FBC0022;
	Tue, 17 Aug 2021 12:49:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E64DC000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AE75607F2
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXA_G1kz_j4O for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:49:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C225E607E2
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:49:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="277099219"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="277099219"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 05:49:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="520459403"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.252])
 ([10.254.211.252])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 05:49:14 -0700
Subject: Re: [PATCH v1 3/3] iommu/vt-d: Fix Unexpected page request in
 Privilege Mode
To: Liu Yi L <yi.l.liu@intel.com>, iommu@lists.linux-foundation.org
References: <20210817042425.1784279-1-yi.l.liu@intel.com>
 <20210817042425.1784279-4-yi.l.liu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <03b53572-5e51-28f6-8cd6-8f516bbfc1a6@linux.intel.com>
Date: Tue, 17 Aug 2021 20:49:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817042425.1784279-4-yi.l.liu@intel.com>
Content-Language: en-US
Cc: yi.y.sun@intel.com, jun.j.tian@intel.com
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

On 2021/8/17 12:24, Liu Yi L wrote:
> This patch fixes the below error. This is due to improper iotlb invalidation
> in intel_pasid_tear_down_entry().
> 
> [  180.187556] Unexpected page request in Privilege Mode
> [  180.187565] Unexpected page request in Privilege Mode
> [  180.279933] Unexpected page request in Privilege Mode
> [  180.279937] Unexpected page request in Privilege Mode
> 
> Per chapter 6.5.3.3 of VT-d spec 3.3, when tear down a pasid entry, software
> should use Domain selective IOTLB flush if the PGTT of the pasid entry is
> SL only or Nested, while for the pasid entries whose PGTT is FL only or PT
> using PASID-based IOTLB flush is enough.
> 
> Fixes: 1c4f88b7f1f9 ("iommu/vt-d: Shared virtual address in scalable mode")
> Cc: Lu Baolu<baolu.lu@linux.intel.com>
> Signed-off-by: Kumar Sanjay K<sanjay.k.kumar@intel.com>
> Signed-off-by: Liu Yi L<yi.l.liu@intel.com>
> Tested-by: Yi Sun<yi.y.sun@intel.com>

Good catch! Thanks!

It has been queued for iommu/fix.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
