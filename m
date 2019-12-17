Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DA1227D3
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 10:43:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2270F844E9;
	Tue, 17 Dec 2019 09:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0RJweUN8HEx; Tue, 17 Dec 2019 09:43:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B404D844E4;
	Tue, 17 Dec 2019 09:43:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95EDBC077D;
	Tue, 17 Dec 2019 09:43:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07594C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E13CA204C9
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YgW4oI2VduR for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:43:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A8AD20481
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:43:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 921C4286; Tue, 17 Dec 2019 10:43:05 +0100 (CET)
Date: Tue, 17 Dec 2019 10:43:04 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: [Patch v2 0/3] iommu: reduce spinlock contention on fast path
Message-ID: <20191217094304.GF8689@8bytes.org>
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Nov 28, 2019 at 04:48:52PM -0800, Cong Wang wrote:
> This patchset contains three small optimizations for the global spinlock
> contention in IOVA cache. Our memcache perf test shows this reduced its
> p999 latency down by 45% on AMD when IOMMU is enabled.

Sounds nice. Can you please re-send with Robin Murphy on Cc? Robin, can
you have a look at these IOVA changes please?

Thanks,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
