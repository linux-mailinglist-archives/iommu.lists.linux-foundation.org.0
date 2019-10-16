Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE39D9650
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 18:03:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 793D2DCF;
	Wed, 16 Oct 2019 16:03:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AEBCF9E7
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 16:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3A4B389D
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 16:03:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 852C0B412;
	Wed, 16 Oct 2019 16:03:16 +0000 (UTC)
Date: Wed, 16 Oct 2019 18:03:14 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: "Convert the AMD iommu driver to the dma-iommu api" is buggy
Message-ID: <20191016160314.GH4695@suse.de>
References: <1571237707.5937.58.camel@lca.pw> <1571237982.5937.60.camel@lca.pw>
	<20191016153112.GF4695@suse.de> <1571241213.5937.64.camel@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571241213.5937.64.camel@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>, Tom Murphy <murphyt7@tcd.ie>,
	linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Oct 16, 2019 at 11:53:33AM -0400, Qian Cai wrote:
> On Wed, 2019-10-16 at 17:31 +0200, Joerg Roedel wrote:

> The x86 one might just be a mistake.
> =

> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index ad05484d0c80..63c4b894751d 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -2542,7 +2542,7 @@ static int amd_iommu_map(struct iommu_domain *dom,
> unsigned long iova,
> =A0=A0=A0=A0=A0=A0=A0=A0if (iommu_prot & IOMMU_WRITE)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0prot |=3D IOMMU_PROT_IW;
> =A0
> -=A0=A0=A0=A0=A0=A0=A0ret =3D iommu_map_page(domain, iova, paddr, page_si=
ze, prot, GFP_KERNEL);
> +=A0=A0=A0=A0=A0=A0=A0ret =3D iommu_map_page(domain, iova, paddr, page_si=
ze, prot, gfp);

Yeah, that is a bug, I spotted that too.

> @@ -1185,7 +1185,7 @@ static struct iommu_dma_msi_page
> *iommu_dma_get_msi_page(struct device *dev,
> =A0=A0=A0=A0=A0=A0=A0=A0if (!iova)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto out_free_page;
> =A0
> -=A0=A0=A0=A0=A0=A0=A0if (iommu_map(domain, iova, msi_addr, size, prot))
> +=A0=A0=A0=A0=A0=A0=A0if (iommu_map_atomic(domain, iova, msi_addr, size, =
prot))
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto out_free_iova;

Not so sure this is a bug, this code is only about setting up MSIs on
ARM. It probably doesn't need to be atomic.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
