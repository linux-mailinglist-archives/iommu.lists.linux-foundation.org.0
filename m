Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A11E428A
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 14:39:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F697864CB;
	Wed, 27 May 2020 12:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLJYx8BwzupV; Wed, 27 May 2020 12:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0AB988682A;
	Wed, 27 May 2020 12:39:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E402BC016F;
	Wed, 27 May 2020 12:39:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADD3EC016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 12:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A95BC864B8
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 12:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEskseHrDO1M for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 12:39:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F3970864A0
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 12:39:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 82F30247; Wed, 27 May 2020 14:39:25 +0200 (CEST)
Date: Wed, 27 May 2020 14:39:24 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 0/2] drivers/iommu: Constify structs
Message-ID: <20200527123923.GJ5221@8bytes.org>
References: <20200525214958.30015-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525214958.30015-1-rikard.falkeborn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arm-kernel@lists.infradead.org
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

On Mon, May 25, 2020 at 11:49:56PM +0200, Rikard Falkeborn wrote:
> Constify some structs with function pointers to allow the compiler to
> put them in read-only memory. There is not dependency between the
> patches.
> 
> Rikard Falkeborn (2):
>   iommu/hyper-v: Constify hyperv_ir_domain_ops
>   iommu/sun50i: Constify sun50i_iommu_ops
> 
>  drivers/iommu/hyperv-iommu.c | 2 +-
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied both, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
