Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C84FEFB9
	for <lists.iommu@lfdr.de>; Wed, 13 Apr 2022 08:20:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611D060F33;
	Wed, 13 Apr 2022 06:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vH7s94sG-6wp; Wed, 13 Apr 2022 06:20:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 80CB860C03;
	Wed, 13 Apr 2022 06:20:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CE06C0088;
	Wed, 13 Apr 2022 06:20:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E322CC002C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 06:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAC6A829FE
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 06:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogXiRIKvj1S6 for <iommu@lists.linux-foundation.org>;
 Wed, 13 Apr 2022 06:20:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 732B181B69
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 06:20:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5281E68B05; Wed, 13 Apr 2022 08:20:37 +0200 (CEST)
Date: Wed, 13 Apr 2022 08:20:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: Re: cleanup swiotlb initialization v8
Message-ID: <20220413062037.GA450@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Apr 04, 2022 at 07:05:44AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series tries to clean up the swiotlb initialization, including
> that of swiotlb-xen.  To get there is also removes the x86 iommu table
> infrastructure that massively obsfucates the initialization path.
> 
> Git tree:
> 
>     git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup

I've updated the git tree above with the commit message nitpicks and
received reviews.  I plan to pull the patches into the dma-mapping
tree after -rc3 is released, so if any involved maintainer is not happy
with the result, please speak up now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
