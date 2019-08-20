Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61495421
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 04:15:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EAAA2CB5;
	Tue, 20 Aug 2019 02:14:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8FC72C8B
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 02:14:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 31D9B8A6
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 02:14:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B85B468B02; Tue, 20 Aug 2019 04:14:52 +0200 (CEST)
Date: Tue, 20 Aug 2019 04:14:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: regression in ath10k dma allocation
Message-ID: <20190820021452.GA22792@lst.de>
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
	<20190816164301.GA3629@lst.de>
	<af96ea6a-2b17-9b66-7aba-b7dae5bcbba5@mni.thm.de>
	<20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
	<20190818031328.11848-1-hdanton@sina.com>
	<acd7a4b0-fde8-1aa2-af07-2b469e5d5ca7@mni.thm.de>
	<20190820015852.GA15830@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820015852.GA15830@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Hillf Danton <hdanton@sina.com>, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath10k@lists.infradead.org, davem@davemloft.net,
	iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de,
	Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>,
	robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, kvalo@codeaurora.org
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

On Mon, Aug 19, 2019 at 06:58:52PM -0700, Nicolin Chen wrote:
> Right...the condition was in-between. However, not every caller
> of dma_alloc_contiguous() is supposed to have a coherent check.
> So we either add a 'bool coherent_ok' to the API or revert the
> dma-direct part back to the original. Probably former option is
> better?
> 
> Thank you for the debugging. I have been a bit distracted, may
> not be able to submit a fix very soon. Would you like to help?

Yeah, it turns out that while the idea for the dma_alloc_contiguous
helper was neat it didn't work out at all, and me pushing Nicolin
down that route was not a very smart idea.  Sorry for causing this
mess.

I think we'll just need to open code it for dma-direct for 5.3.
Hillf do you want to cook up a patch or should I do it?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
