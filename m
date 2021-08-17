Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA83EECD4
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 14:51:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A80080F8C;
	Tue, 17 Aug 2021 12:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWJPwVVlPd4m; Tue, 17 Aug 2021 12:51:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7E41E8183D;
	Tue, 17 Aug 2021 12:51:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47C12C000E;
	Tue, 17 Aug 2021 12:51:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1A51C000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B41140454
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDKTZDWqxbKq for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:51:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6E084044A
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:51:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="203273574"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="203273574"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 05:51:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="520460118"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.252])
 ([10.254.211.252])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 05:51:10 -0700
Subject: Re: [PATCH] iommu/vt-d: Fix PASID reference leak
To: Fenghua Yu <fenghua.yu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Ashok Raj <ashok.raj@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Jacob Jun Pan
 <jacob.jun.pan@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>
References: <20210813181345.1870742-1-fenghua.yu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <cea0e7a7-8653-a0e4-df8f-e9fd70cc38ee@linux.intel.com>
Date: Tue, 17 Aug 2021 20:51:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210813181345.1870742-1-fenghua.yu@intel.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org
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

On 2021/8/14 2:13, Fenghua Yu wrote:
> A PASID reference is increased whenever a device is bound to an mm (and
> its PASID) successfully (i.e. the device's sdev user count is increased).
> But the reference is not dropped every time the device is unbound
> successfully from the mm (i.e. the device's sdev user count is decreased).
> The reference is dropped only once by calling intel_svm_free_pasid() when
> there isn't any device bound to the mm. intel_svm_free_pasid() drops the
> reference and only frees the PASID on zero reference.
> 
> Fix the issue by dropping the PASID reference and freeing the PASID when
> no reference on successful unbinding the device by calling
> intel_svm_free_pasid() .
> 
> Signed-off-by: Fenghua Yu<fenghua.yu@intel.com>

Patch has been queued for iommu/fix.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
