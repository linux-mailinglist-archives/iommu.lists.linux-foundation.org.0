Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C3251799
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 13:30:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63448882F2;
	Tue, 25 Aug 2020 11:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8+xiTL12avZ; Tue, 25 Aug 2020 11:30:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 802A8882EC;
	Tue, 25 Aug 2020 11:30:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 586B2C0051;
	Tue, 25 Aug 2020 11:30:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C208C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 11:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EC7CD882EC
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 11:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jamcoOkEyk9e for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 11:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 380E4882DB
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 11:30:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200825113043euoutp01da46852493881597f6fd3f5c269fd9e4~uf3GdAz7j0081100811euoutp01c
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 11:30:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200825113043euoutp01da46852493881597f6fd3f5c269fd9e4~uf3GdAz7j0081100811euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598355043;
 bh=X8gDcs427W02/qFtPNsPSdmNDXjqciYwh7aa0XOpqik=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=bf/T+vWpq9orb92VKlt6rntA6M0vAXl4taqwUbJIAGHnDbeMzHeZRFEFmsAXDYrNq
 Wr9AKv7vwxCWJ/Vo6hIhRgWr9K0GkTMScEkS+wDoQCoPXqBM2W4KpgH6J+25PIJB7S
 XU9Qwn50dCGine2uiKApqXnlXT7+4oTjOnOc6UhQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200825113043eucas1p2a677e17885157748102be36111dd7cf0~uf3GIA3vS2151921519eucas1p2e;
 Tue, 25 Aug 2020 11:30:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2B.B0.06456.366F44F5; Tue, 25
 Aug 2020 12:30:43 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200825113042eucas1p156019fa8529e69de368498a0a7b4279f~uf3FqdPEE0129601296eucas1p1w;
 Tue, 25 Aug 2020 11:30:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200825113042eusmtrp2f1d062dd589e815ab44765282723204c~uf3FpmMBe1642116421eusmtrp26;
 Tue, 25 Aug 2020 11:30:42 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-75-5f44f663c15d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 45.58.06017.266F44F5; Tue, 25
 Aug 2020 12:30:42 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200825113041eusmtip26d77690ed3da6b991eebf229d4dff802~uf3EXjFCA0971809718eusmtip2L;
 Tue, 25 Aug 2020 11:30:41 +0000 (GMT)
Subject: Re: a saner API for allocating DMA addressable pages
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Joonyoung
 Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>, Matt Porter <mporter@kernel.crashing.org>,
 iommu@lists.linux-foundation.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <8fa1ce36-c783-1a02-6890-211eb504a33b@samsung.com>
Date: Tue, 25 Aug 2020 13:30:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0yTZxT2/e6g1dd64QQX1C4Yt8RL1ZjXqHiN+UZm4g+XbMsG1vIFUC7a
 ghf+WAsabsFZ0LLaBdgMzG6KfgMHGktEpSLhbkXxrvVSY1EpYkpUpHyg/HvOc55znuckR6DV
 tVy4kJiSJhlSdEkaLpQ52xBonafvXx+7cKAXk+vt9RTxVmQjcuKfKxQprVtOzhwSyPN77Qxp
 Nr/kifz4BkvKDh5nyOvsHpZ0nrNzJP90NUty5GpE7v07yJKS8ic8eXStjSLFrU6K5HXVcKRc
 fk+RI63vaNJQOp28KyhgSZEvwJPiQi9HLhc5WXLJfJFeHS4e6KhgxNN+MzeEPnDiUcs1Tsx/
 mcWKsiOHE+VeCy/ez3NR4n/H94mFNyuQeP6WiRMfD3g58ZXTzYkFVQ4k+uWITZN+Dl0RJyUl
 7pIMC6K2hCbIXQ5qx7NJe7rP25EJeSbkohAB8BJoqm5kc1GooMZ/I7BVukeKPgTNOQEuqFJj
 P4KTV5eNTtw5YaUUUQWCPFsNpxSvEPR9yEZB1RS8EnrkB8OrpuIuGkrsATrYoHErDZ7K8UHM
 YS3k+nKHLVQ4CrL8Vj6IGRwJV+quMkE8DcdAtctNKZrJ0Pi7Z5gPwYvg2OWnvLJzJvzvs4/s
 D4NuT8lwPMCDAvSdOcQoudfDbbOfV/AUeOGqGsFfwWDt6EAmgoctJ3mlyEfQaS5Gimo53GkZ
 GIoqDFl8A5XnFij0GmioO8wEacAT4aZvshJiIljOWmmFVkH2QbWingM216nPthfbOujfkMY2
 5jTbmHNsY86xffEtRYwDhUnpxuR4yahNkXbPN+qSjekp8fP1qckyGnropo+u3hr0tmNrPcIC
 0kxQmZzrYtWsbpdxb3I9AoHWTFWtbW6KUavidHszJENqrCE9STLWoxkCowlTLf7T+6sax+vS
 pO2StEMyjHYpISTchAx/lP1VGTVOdyGiMWdzgr7Wl7ZFu7Dq7oYLT3w/ZJS791szflzrjF7U
 5o20buJ7ZiZ29s+aW7jUEmPVrirLN2daEtM7ZjuKrv/ydrM7YmP7gzf6rw07o+fGpUa3RA/+
 NK972oHFge8zN3gj9f3bXuyhs56a7N/ZT+EVWcyxmK1z7nsYDWNM0Gm/pQ1G3SdTBG82zAMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d3X7sThbWr9sqhYBVE523TuZ6VICd2CIOqfqHSuuqi1h+xu
 kkE1zIVOs8d8lJkamqKV2E1TKpQ0M7UwzSwlzXKVi2YP6YllzhX434fzPZ9zOHBoXPqQDKKT
 DGbOZNDqZJQP0fWnfTh477cYzZpBZzDq62nBkKsyA6CqK20YKm1eh66fotHYcA+BHqV9ECFh
 tJ9El06UE+hTxjiJntwqolB2bT2JMoV6gIavTpGopOKNCL3ufIyhc91NGMp61kihCmESQ3nd
 33F0v3Qu+p6TQ6Jc908ROudwUehebhOJWtPu4tFBrK23kmBrJ9KoafpNsflnOyk2+0M6yQrV
 mRQrfDkrYl9mtWPsjfJjrON5JWBvD1gpdvSXi2I/Nj2l2Jy6asBOCIu2+e2SrzcZLWZuSaKR
 N0fKdiuQUq6IQHJlWIRcEaqOXatUyUKi1u/ndEkpnCkkKl6eKDyrxpLf+R0avF0ErMDpawdi
 GjJh8EVVAWYHPrSUuQygraEN8wYLYUe+lfSyP5zst1PeJjeA7v7juCfwZyLhuDBCeoIAZgCH
 v93vCU+AM9047MxgvYYNwPeZZTOjKEYB7W7PKDEtYaJg+kSByMMEsxy2NT+YkQOZODh6cgr3
 9syBHeedM3Uxo4QX7r0VeReEw+Ibr3AvL4YN7qJ/PA8OOkuw00BaOEsvnKUUzlIKZymlgKgG
 AZyF1yfoeaWc1+p5iyFBvs+oF8D0J928/7OuEdjHd7QAhgYyX4m1aaNGSmpT+FR9C4A0LguQ
 bHjUFSeV7NemHuZMRo3JouP4FqCaPu4MHhS4zzj9lwazRqFSqFGEQh2qDg1HsnmSDObuHimT
 oDVzBzkumTP99zBaHGQF6s2TqrboElXxCnFsqs9YmGG5j41w1ehaG4bqv9kji5ZohyrT66aO
 9LWmhuQ9HvG9ltxY9lXXt3OVaYE6PuxA8IPtJUcv/gjPn9+xbdzZW9Vscdx5GOiwXYqK2Cra
 Ep8uf65Z6oifU9Ne23q5ZpO6Z3VMRU2cK7kXvzC2ZZly3WeRjOATtYqVuInX/gXVsGUeXwMA
 AA==
X-CMS-MailID: 20200825113042eucas1p156019fa8529e69de368498a0a7b4279f
X-Msg-Generator: CA
X-RootMTR: 20200819065610eucas1p2fde88e81917071b1888e7cc01ba0f298
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200819065610eucas1p2fde88e81917071b1888e7cc01ba0f298
References: <CGME20200819065610eucas1p2fde88e81917071b1888e7cc01ba0f298@eucas1p2.samsung.com>
 <20200819065555.1802761-1-hch@lst.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Hi Christoph,

On 19.08.2020 08:55, Christoph Hellwig wrote:
> this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
> with a separate new dma_alloc_pages API, which is available on all
> platforms.  In addition to cleaning up the convoluted code path, this
> ensures that other drivers that have asked for better support for
> non-coherent DMA to pages with incurring bounce buffering over can finally
> be properly supported.
>
> I'm still a little unsure about the API naming, as alloc_pages sort of
> implies a struct page return value, but we return a kernel virtual
> address.  The other alternative would be to name the API
> dma_alloc_noncoherent, but the whole non-coherent naming seems to put
> people off.  As a follow up I plan to move the implementation of the
> DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> that is also is a fundamentally non coherent allocation.  The replacement
> for that flag would then return a struct page, as it is allowed to
> actually return pages without a kernel mapping as the name suggested
> (although most of the time they will actually have a kernel mapping..)
>
> In addition to the conversions of the existing non-coherent DMA users
> the last three patches also convert the DMA coherent allocations in
> the NVMe driver to use this new framework through a dmapool addition.
> This was both to give me a good testing vehicle, but also because it
> should speed up the NVMe driver on platforms with non-coherent DMA
> nicely, without a downside on platforms with cache coherent DMA.

I really wonder what is the difference between this new API and 
alloc_pages(GFP_DMA, n). Is this API really needed? I thought that this 
is legacy thing to be removed one day...

Maybe it would make more sense to convert the few remaining drivers to 
regular dma_map_page()/dma_sync_*()/dma_unmap_page() or have I missed 
something?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
