Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3985BFE
	for <lists.iommu@lfdr.de>; Thu,  8 Aug 2019 09:49:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4B29C77;
	Thu,  8 Aug 2019 07:49:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 32A07B09
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 07:49:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B3B9714D
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 07:49:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B117968B02; Thu,  8 Aug 2019 09:48:58 +0200 (CEST)
Date: Thu, 8 Aug 2019 09:48:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: Regression due to d98849aff879 (dma-direct: handle
	DMA_ATTR_NO_KERNEL_MAPPING in common code)
Message-ID: <20190808074858.GA30308@lst.de>
References: <1565082809.2323.24.camel@pengutronix.de>
	<20190806113318.GA20215@lst.de>
	<41cc93b1-62b5-7fb6-060d-01982e68503b@amd.com>
	<20190806140408.GA22902@lst.de>
	<1565100418.2323.32.camel@pengutronix.de>
	<20190806154403.GA25050@lst.de>
	<1565191457.2323.41.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565191457.2323.41.camel@pengutronix.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
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

On Wed, Aug 07, 2019 at 05:24:17PM +0200, Lucas Stach wrote:
> I would suggest to place this line above the comment, as the comment
> only really applies to the return value. Other than this nitpick, this
> matches my understanding of the required changes, so:
> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Thanks, I've applied it with that fixed up.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
