Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE356554A4E
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 14:48:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 083228405B;
	Wed, 22 Jun 2022 12:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 083228405B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-fuIr91RUVj; Wed, 22 Jun 2022 12:48:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 12C418404E;
	Wed, 22 Jun 2022 12:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C418404E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0DD5C0081;
	Wed, 22 Jun 2022 12:48:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C134C002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32F6A40390
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F6A40390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jzkDo-KJDLu4 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:48:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F2F40012
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83F2F40012
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:48:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6412E2D0; Wed, 22 Jun 2022 14:48:11 +0200 (CEST)
Date: Wed, 22 Jun 2022 14:48:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Ke Liu <liuke94@huawei.com>
Subject: Re: [PATCH v2] iommu: Directly use ida_alloc()/free()
Message-ID: <YrMPiqOr/ApPvu6Y@8bytes.org>
References: <20220608021655.1538087-1-liuke94@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608021655.1538087-1-liuke94@huawei.com>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
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

On Wed, Jun 08, 2022 at 02:16:55AM +0000, Ke Liu wrote:
> Use ida_alloc()/ida_free() instead of deprecated
> ida_simple_get()/ida_simple_remove().
> 
> Signed-off-by: Ke Liu <liuke94@huawei.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> v2 subject change to iommu
> ---
>  drivers/iommu/iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
