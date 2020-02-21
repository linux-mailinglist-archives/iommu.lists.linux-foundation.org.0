Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AC4166B3D
	for <lists.iommu@lfdr.de>; Fri, 21 Feb 2020 01:00:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A91587E34;
	Fri, 21 Feb 2020 00:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2UdRNTK6lUV; Fri, 21 Feb 2020 00:00:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38F3387E38;
	Fri, 21 Feb 2020 00:00:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 215D3C013E;
	Fri, 21 Feb 2020 00:00:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C646C013E
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 00:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3AAC387E34
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 00:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9izVXrIDAjQ for <iommu@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 00:00:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F1F4687E23
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 00:00:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 16:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="254645732"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.224])
 ([10.254.211.224])
 by orsmga002.jf.intel.com with ESMTP; 20 Feb 2020 16:00:46 -0800
Subject: Re: [PATCH] iommu/vt-d: fix the wrong printing in RHSA parsing
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>, linux-kernel@vger.kernel.org
References: <20200115102815.264-1-zhenzhong.duan@gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <470b6a1b-458e-0c81-71d7-51e2a6b70b9b@linux.intel.com>
Date: Fri, 21 Feb 2020 08:00:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200115102815.264-1-zhenzhong.duan@gmail.com>
Content-Language: en-US
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 iommu@lists.linux-foundation.org
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

Hi,

On 2020/1/15 18:28, Zhenzhong Duan wrote:
> When base address in RHSA structure doesn't match base address in
> each DRHD structure, the base address in last DRHD is printed out.
> 
> This doesn't make sense when there are multiple DRHD units, fix it
> by printing the buggy RHSA's base address.
> 
> Signed-off-by: Zhenzhong Duan<zhenzhong.duan@gmail.com>
> Cc: David Woodhouse<dwmw2@infradead.org>
> Cc: Lu Baolu<baolu.lu@linux.intel.com>
> Cc: Joerg Roedel<joro@8bytes.org>
> Cc:iommu@lists.linux-foundation.org

Queued for v5.7. Thanks!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
