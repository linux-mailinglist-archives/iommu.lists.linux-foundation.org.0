Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68094358800
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 17:16:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2DF140111;
	Thu,  8 Apr 2021 15:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31wEd2R-PLy5; Thu,  8 Apr 2021 15:16:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E91D4015D;
	Thu,  8 Apr 2021 15:16:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0CF4C000A;
	Thu,  8 Apr 2021 15:16:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FF97C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 15:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BCC7418FB
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 15:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPmfVlRfQ7bi for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 15:16:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91728418F7
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 15:16:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BBED81B0; Thu,  8 Apr 2021 17:16:45 +0200 (CEST)
Date: Thu, 8 Apr 2021 17:16:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH] iommu/amd: page-specific invalidations for more than one
 page
Message-ID: <YG8eXLft4R+Nq+Ip@8bytes.org>
References: <20210323210619.513069-1-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323210619.513069-1-namit@vmware.com>
Cc: Nadav Amit <namit@vmware.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Jiajun Cao <caojiajun@vmware.com>,
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

On Tue, Mar 23, 2021 at 02:06:19PM -0700, Nadav Amit wrote:
>  drivers/iommu/amd/iommu.c | 76 +++++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 34 deletions(-)

Load-testing looks good here too, so this patch is queued now for v5.13,
thanks Nadav.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
