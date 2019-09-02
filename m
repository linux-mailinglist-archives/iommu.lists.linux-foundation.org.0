Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A665CA4D6B
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 05:07:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 630308BF;
	Mon,  2 Sep 2019 03:07:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE955265
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 03:07:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 351A95D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 03:07:31 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
	id 46MFPW6NYNz9sDQ; Mon,  2 Sep 2019 13:07:27 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 0c9c1d56397518eb823d458b00b06bcccd956794
In-Reply-To: <20190806044919.10622-2-bauerman@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, x86@kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/6] x86,
	s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig
Message-Id: <46MFPW6NYNz9sDQ@ozlabs.org>
Date: Mon,  2 Sep 2019 13:07:27 +1000 (AEST)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Lianbo Jiang <lijiang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linuxppc-dev@lists.ozlabs.org, Mike Anderson <andmike@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Halil Pasic <pasic@linux.ibm.com>,
	iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-fsdevel@vger.kernel.org, Thomas Lendacky <Thomas.Lendacky@amd.com>,
	Robin Murphy <robin.murphy@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 2019-08-06 at 04:49:14 UTC, Thiago Jung Bauermann wrote:
> powerpc is also going to use this feature, so put it in a generic location.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Series applied to powerpc topic/mem-encrypt, thanks.

https://git.kernel.org/powerpc/c/0c9c1d56397518eb823d458b00b06bcccd956794

cheers
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
