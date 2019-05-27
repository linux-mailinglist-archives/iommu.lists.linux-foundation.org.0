Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B052B879
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 17:40:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 79FB81A01;
	Mon, 27 May 2019 15:40:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3F4E819EE
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:38:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5E776C5
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:38:54 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 79D5C68AA6; Mon, 27 May 2019 17:38:29 +0200 (CEST)
Date: Mon, 27 May 2019 17:38:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: implement generic dma_map_ops for IOMMUs v5
Message-ID: <20190527153829.GA31620@lst.de>
References: <20190520072948.11412-1-hch@lst.de>
	<20190527153751.GF12745@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527153751.GF12745@8bytes.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Murphy <tmurphy@arista.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, May 27, 2019 at 05:37:51PM +0200, Joerg Roedel wrote:
> I applied this series to a new generic-dma-ops branch in the iommu
> tree and plan to send it upstream in the next merge window.

Thanks!  Can you push the branch out ASAP, as I'll need to pull it
into the dma-mapping tree to avoid creating nasty conflicts for the
pending rework of the DMA CMA and contigous allocators?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
