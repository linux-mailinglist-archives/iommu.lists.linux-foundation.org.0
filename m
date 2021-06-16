Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5602A3A9D75
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 16:21:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB14460602;
	Wed, 16 Jun 2021 14:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Apkoy1486Af; Wed, 16 Jun 2021 14:21:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0AD2C60A54;
	Wed, 16 Jun 2021 14:21:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9313C000B;
	Wed, 16 Jun 2021 14:21:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8345DC000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 14:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61AF3406A4
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 14:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wG836RdkipH for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 14:21:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C43E405ED
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 14:21:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E68C468BEB; Wed, 16 Jun 2021 16:21:48 +0200 (CEST)
Date: Wed, 16 Jun 2021 16:21:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] swiotlb-xen: override common mmap and get_sgtable
 dma ops
Message-ID: <20210616142148.GA764@lst.de>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
 <20210616114205.38902-1-roman_skakun@epam.com>
 <20210616114205.38902-2-roman_skakun@epam.com>
 <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roman Skakun <rm.skakun@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 iommu@lists.linux-foundation.org, Andrii Anisov <andrii_anisov@epam.com>,
 Roman Skakun <roman_skakun@epam.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Christoph Hellwig <hch@lst.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Jun 16, 2021 at 10:12:55AM -0400, Boris Ostrovsky wrote:
> I wonder now whether we could avoid code duplication between here and dma=
_common_mmap()/dma_common_get_sgtable() and use your helper there.
> =

> =

> Christoph, would that work?=A0 I.e. something like

You should not duplicate the code at all, and just make the common
helpers work with vmalloc addresses.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
