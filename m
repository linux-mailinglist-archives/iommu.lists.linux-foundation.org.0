Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 726E6122838
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 11:02:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2949F85465;
	Tue, 17 Dec 2019 10:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTX6Wt0MDuHT; Tue, 17 Dec 2019 10:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11EB485B5C;
	Tue, 17 Dec 2019 10:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB368C1D84;
	Tue, 17 Dec 2019 10:02:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCBF9C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A13508708F
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cL77mSL8e9MA for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 10:02:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D3428700D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:02:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 13033286; Tue, 17 Dec 2019 11:02:19 +0100 (CET)
Date: Tue, 17 Dec 2019 11:02:17 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Xiaotao Yin <xiaotao.yin@windriver.com>
Subject: Re: [PATCH V2] iommu/iova: Init the struct iova to fix the possible
 memleak
Message-ID: <20191217100217.GH8689@8bytes.org>
References: <20191209082404.40166-1-xiaotao.yin@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209082404.40166-1-xiaotao.yin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Kexin.Hao@windriver.com
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

On Mon, Dec 09, 2019 at 04:24:04PM +0800, Xiaotao Yin wrote:
> The reason:
> When alloc_iova_mem() without initial with Zero, sometimes fpn_lo will equal to
> IOVA_ANCHOR by chance, so when return from __alloc_and_insert_iova_range() with
> -ENOMEM(iova32_full), the new_iova will not be freed in free_iova_mem().
> 
> Fixes: bb68b2fbfbd6 ("iommu/iova: Add rbtree anchor node")
> Signed-off-by: Xiaotao Yin <xiaotao.yin@windriver.com>
> ---
>  drivers/iommu/iova.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.5, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
