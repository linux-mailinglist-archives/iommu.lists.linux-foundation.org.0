Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BA1906D1
	for <lists.iommu@lfdr.de>; Tue, 24 Mar 2020 08:52:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC84186901;
	Tue, 24 Mar 2020 07:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gU_vuBrF_a7X; Tue, 24 Mar 2020 07:52:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F41C85F83;
	Tue, 24 Mar 2020 07:52:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E1F2C1D89;
	Tue, 24 Mar 2020 07:52:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 831EDC0177
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 07:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7E5A6868E7
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 07:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foH8I6FZr2OR for <iommu@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 07:52:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2441485F83
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 07:52:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE3EB68BFE; Tue, 24 Mar 2020 08:52:25 +0100 (CET)
Date: Tue, 24 Mar 2020 08:52:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200324075225.GI23447@lst.de>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
 <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
 <20200323083705.GA31245@lst.de>
 <37ce1b7e-264d-292d-32b1-093b24b3525c@ozlabs.ru>
 <20200323172014.GA31269@lst.de>
 <d4bf6058-aa77-d0bc-8196-f4c27fb21b74@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4bf6058-aa77-d0bc-8196-f4c27fb21b74@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Mar 24, 2020 at 02:37:59PM +1100, Alexey Kardashevskiy wrote:
> dma_alloc_direct() and dma_map_direct() do the same thing now which is
> good, did I miss anything else?

dma_alloc_direct looks at coherent_dma_mask, dma_map_direct looks
at dma_mask.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
