Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B545429
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 07:44:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E62EFDCA;
	Fri, 14 Jun 2019 05:44:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B4C2CD7E
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 05:44:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F1D1E5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 05:44:47 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 7215268B02; Fri, 14 Jun 2019 07:44:18 +0200 (CEST)
Date: Fri, 14 Jun 2019 07:44:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: Re: switch nios2 and microblaze to use the generic uncached
	segement support
Message-ID: <20190614054418.GA6722@lst.de>
References: <20190603065324.9724-1-hch@lst.de>
	<1560476434.21652.1.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560476434.21652.1.camel@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	linux-mips@vger.kernel.org
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

On Fri, Jun 14, 2019 at 09:40:34AM +0800, Ley Foon Tan wrote:
> Hi=A0Christoph
> =

> Can this patch in=A0http://git.infradead.org/users/hch/dma-mapping.git/sh
> ortlog/refs/heads/for-next
> =

> [PATCH 1/2] nios2: use the generic uncached segment support in dma-
> direct

Hi Ley Foon,

I don't understand the above sentence.  Does it imply a Reviewed-by?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
