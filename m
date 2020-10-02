Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A19712812D2
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 14:34:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 273AF204EB;
	Fri,  2 Oct 2020 12:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9knoxdruAzPB; Fri,  2 Oct 2020 12:34:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A3C26204BE;
	Fri,  2 Oct 2020 12:34:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 925CFC0051;
	Fri,  2 Oct 2020 12:34:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5161C0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 12:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B400D872EA
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 12:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3q8HdQLIYwsY for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 12:34:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5062C872E8
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 12:34:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A8EFB67373; Fri,  2 Oct 2020 14:34:36 +0200 (CEST)
Date: Fri, 2 Oct 2020 14:34:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: xen-swiotlb vs phys_to_dma
Message-ID: <20201002123436.GA30329@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

Hi Stefano,

I've looked over xen-swiotlb in linux-next, that is with your recent
changes to take dma offsets into account.  One thing that puzzles me
is that xen_swiotlb_map_page passes virt_to_phys(xen_io_tlb_start) as
the tbl_dma_addr argument to swiotlb_tbl_map_single, despite the fact
that the argument is a dma_addr_t and both other callers translate
from a physical to the dma address.  Was this an oversight?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
