Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2743A0DEB
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 09:42:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E436740168;
	Wed,  9 Jun 2021 07:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ViCaQnlYp3G; Wed,  9 Jun 2021 07:42:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 02889400D4;
	Wed,  9 Jun 2021 07:42:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3A92C0024;
	Wed,  9 Jun 2021 07:42:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38995C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A874048B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUo3SmHWM09J for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 120B04048A
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:42:23 +0000 (UTC)
IronPort-SDR: v7119E63HASJuM06R8Zgess5uBSYskIQR3PNQnJg7phb3mYSCoqhwgFkfsLcKdQSO67TitZ4HO
 96g7QbRPD74A==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="268877756"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="268877756"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:42:23 -0700
IronPort-SDR: VCtr/1WZwBgJ3yMY+bSneUud0u19//M8V/8lcOnj18fKBnugu+vjpZ+XmGOt+Ez8j+PMrEV7qd
 FeIVpV/xmbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="552589693"
Received: from allen-box.sh.intel.com (HELO [10.239.159.105])
 ([10.239.159.105])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2021 00:42:21 -0700
Subject: Re: [PATCH v2][next] iommu/vt-d: Fix out-bounds-warning in
 intel_svm_page_response()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20210414201403.GA392764@embeddedor>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <928b163d-b754-4135-f3f3-5f08492f93eb@linux.intel.com>
Date: Wed, 9 Jun 2021 15:41:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414201403.GA392764@embeddedor>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On 4/15/21 4:14 AM, Gustavo A. R. Silva wrote:
> Replace a couple of calls to memcpy() with simple assignments in order
> to fix the following out-of-bounds warning:
> 
> drivers/iommu/intel/svm.c:1198:4: warning: 'memcpy' offset [25, 32] from the object at 'desc' is out of the bounds of referenced subobject 'qw2' with type 'long long unsigned int' at offset 16 [-Warray-bounds]
> 
> The problem is that the original code is trying to copy data into a
> couple of struct members adjacent to each other in a single call to
> memcpy(). This causes a legitimate compiler warning because memcpy()
> overruns the length of &desc.qw2 and &resp.qw2, respectively.
> 
> This helps with the ongoing efforts to globally enable -Warray-bounds
> and get us closer to being able to tighten the FORTIFY_SOURCE routines
> on memcpy().
> 
> Link:https://github.com/KSPP/linux/issues/109
> Signed-off-by: Gustavo A. R. Silva<gustavoars@kernel.org>

Queued for v5.14. Thanks!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
