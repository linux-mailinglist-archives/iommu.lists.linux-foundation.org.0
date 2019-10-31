Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C767EB155
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 14:38:41 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 75A7D114B;
	Thu, 31 Oct 2019 13:38:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86A4EAD7
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 13:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4A6A087B
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QkB42TZaY19p2tUWLkDIEWFmICndZjJCiuu8c7FQUq4=;
	b=OewjRBc9r9Xp8/PXv2ckSWK7N
	WX5KxNtEnxuD88ukmOO+8iDivb6it9c5njv2xdlRHDV3ilOSkq+TQL1eZ8py0NxbpFJIK4xgwK6ux
	7D5//CzzfbuOt0waXy9tZOoZuyaFaj6keBpC0pEGDXq0l0ZpuzSYhyoXX9IBE403iJ2khy33zpTr9
	sJDM3/z9b9fFXeAnO2iZzJx16eN0zkdRxNCAyRmFcOIfHAWM7iod8Jv07lYmHFMQ2Rm4qWOBeNu/q
	QKBxAgivmnYe77smiwpxolIuesXJq2NVe/USj+FRAOM5XgZaMqbOpfLsKJvOXgwLXdGuNFg0qOkS+
	TMOLequjA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iQAel-0005dF-3D; Thu, 31 Oct 2019 13:38:31 +0000
Date: Thu, 31 Oct 2019 06:38:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH RFC 1/5] dma/direct: turn ARCH_ZONE_DMA_BITS into a
	variable
Message-ID: <20191031133831.GA21509@infradead.org>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
	<20191014183108.24804-2-nsaenzjulienne@suse.de>
	<20191030214914.GA15939@infradead.org>
	<8c525f66c1c0d9f07e0cff4948d1ec3229756220.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c525f66c1c0d9f07e0cff4948d1ec3229756220.camel@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, mbrugger@suse.com,
	Vasily Gorbik <gor@linux.ibm.com>, wahrenst@gmx.net,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	iommu@lists.linux-foundation.org, f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org
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

On Thu, Oct 31, 2019 at 11:30:36AM +0100, Nicolas Saenz Julienne wrote:
> On Wed, 2019-10-30 at 14:49 -0700, Christoph Hellwig wrote:
> > On Mon, Oct 14, 2019 at 08:31:03PM +0200, Nicolas Saenz Julienne wrote:
> > > Some architectures, notably ARM, are interested in tweaking this
> > > depending on their runtime DMA addressing limitations.
> > > 
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > 
> > Do you want me to pick this up for the 5.5 dma-mapping tree, or do you
> > want me to wait for the rest to settle?
> 
> I'd say take it, this will be ultimately needed once we push forward with ARM.

Can you resend a version that applies against 5.4-rc?  The current one
has conflicts in the arm64 code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
