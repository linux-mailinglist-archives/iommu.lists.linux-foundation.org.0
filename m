Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A93194B539C
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 15:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C00606E7;
	Mon, 14 Feb 2022 14:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmIz4cMwtAXq; Mon, 14 Feb 2022 14:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4658360F08;
	Mon, 14 Feb 2022 14:45:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 342A6C000B;
	Mon, 14 Feb 2022 14:45:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86B9BC000B;
 Mon, 14 Feb 2022 14:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 665D240939;
 Mon, 14 Feb 2022 14:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpf4dW-oIp2e; Mon, 14 Feb 2022 14:45:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3222408E1;
 Mon, 14 Feb 2022 14:45:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A0171374; Mon, 14 Feb 2022 15:45:12 +0100 (CET)
Date: Mon, 14 Feb 2022 15:45:11 +0100
From: Joerg Roedel <joro@8bytes.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2] iommu/iova: Separate out rcache init
Message-ID: <Ygpq9zvzGsFu/FZ1@8bytes.org>
References: <1643882360-241739-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1643882360-241739-1-git-send-email-john.garry@huawei.com>
Cc: mst@redhat.com, will@kernel.org, jasowang@redhat.com, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xieyongji@bytedance.com, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com
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

On Thu, Feb 03, 2022 at 05:59:20PM +0800, John Garry wrote:
> Currently the rcache structures are allocated for all IOVA domains, even if
> they do not use "fast" alloc+free interface. This is wasteful of memory.
> 
> In addition, fails in init_iova_rcaches() are not handled safely, which is
> less than ideal.
> 
> Make "fast" users call a separate rcache init explicitly, which includes
> error checking.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
