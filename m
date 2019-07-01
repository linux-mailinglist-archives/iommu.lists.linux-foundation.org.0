Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7289C131DD
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 18:08:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DDA37AF0;
	Fri,  3 May 2019 16:07:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D72273A50
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 16:06:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3DA9171C
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 16:06:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y5so7380593wma.2
	for <iommu@lists.linux-foundation.org>;
	Fri, 03 May 2019 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VC/Snkdb47YXCrhgoVCm8m87mFow4IXpldKitSIRUm4=;
	b=WPW2uuEQYZhVva1B/kFnzPjaUlaLUB7LHz6G2b/8uJ84ih5o3328e4rXxAUboiXgUM
	J/wO/bHE9XT2eWIiMQWFFY5/3GImZUeiGivUZ/JkzYISpmhpqGhUZgckgutcZLdPVu2S
	UhqkY4W/e+7AWHeB+jtIcDwEjVA+2jagvE048=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VC/Snkdb47YXCrhgoVCm8m87mFow4IXpldKitSIRUm4=;
	b=VaY/dngzn67Jua3bX5gJe4Ted7qBFmij7PT5Jhkx2gi/8+ySn70FE4AfnzAt4wNONo
	Jk6ui8wZ+JCnrHJnpymRAJKMFXgjjIaa6qYYAE3fkQ501O4UNdmwm+5OcvSRm/j4hxUS
	z4JrnLLNd+JgWuEJZrXsR4sMLMxZvsKQM7U9Am1bCWSFMa97W2G02/37cwa6vTkxL9MJ
	s4XNKiBr8AeV7LG9j+KOLlIBqQFH0Spp6W+IKDb52wJAGX9zMUMTedpVysE6MFRwt6qo
	ssdCfSeBuquIlZOlK/RkQdXQcZx8c8/nqqzc97Ee/vZ/X7MzhdbASDCwnlVHHzC5p4gv
	eoeQ==
X-Gm-Message-State: APjAAAVWcsepLP/dZV5HnKbqjqRkGq4Bm+Pu9qpLt5ixZKwO1TzWTGXx
	WxhAlwWdy6yTqH/UTKg0eZJn+0HapZo+WErBZzVgWA==
X-Google-Smtp-Source: APXvYqyFNFaVsmW8OnGepbzg6L4B75nNvpeBtq+W+EyuOasPwlpVHMRBxacV7yDrHYb0ES1XvOUdH+XTu4EYyVOp/1w=
X-Received: by 2002:a05:600c:204d:: with SMTP id
	p13mr7183118wmg.53.1556899615681; 
	Fri, 03 May 2019 09:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <1556892334-16270-1-git-send-email-srinath.mannam@broadcom.com>
	<20190503155306.GA6461@e121166-lin.cambridge.arm.com>
In-Reply-To: <20190503155306.GA6461@e121166-lin.cambridge.arm.com>
Date: Fri, 3 May 2019 21:36:44 +0530
Message-ID: <CABe79T4gMT723uZ1tJ6b4CDZ8y97CshSKtd0MRqXCktJx85+jA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] PCIe Host request to reserve IOVA
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: poza@codeaurora.org, Ray Jui <rjui@broadcom.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org,
	BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Robin Murphy <robin.murphy@arm.com>
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
From: Srinath Mannam via iommu <iommu@lists.linux-foundation.org>
Reply-To: Srinath Mannam <srinath.mannam@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Lorenzo,

Thanks a lot.

Regards,
Srinath.

On Fri, May 3, 2019 at 9:23 PM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Fri, May 03, 2019 at 07:35:31PM +0530, Srinath Mannam wrote:
> > This patch set will reserve IOVA addresses for DMA memory holes.
> >
> > The IPROC host controller allows only a few ranges of physical address
> > as inbound PCI addresses which are listed through dma-ranges DT property.
> > Added dma_ranges list field of PCI host bridge structure to hold these
> > allowed inbound address ranges in sorted order.
> >
> > Process this list and reserve IOVA addresses that are not present in its
> > resource entries (ie DMA memory holes) to prevent allocating IOVA
> > addresses that cannot be allocated as inbound addresses.
> >
> > This patch set is based on Linux-5.1-rc3.
> >
> > Changes from v5:
> >   - Addressed Robin Murphy, Lorenzo review comments.
> >     - Error handling in dma ranges list processing.
> >     - Used commit messages given by Lorenzo to all patches.
> >
> > Changes from v4:
> >   - Addressed Bjorn, Robin Murphy and Auger Eric review comments.
> >     - Commit message modification.
> >     - Change DMA_BIT_MASK to "~(dma_addr_t)0".
> >
> > Changes from v3:
> >   - Addressed Robin Murphy review comments.
> >     - pcie-iproc: parse dma-ranges and make sorted resource list.
> >     - dma-iommu: process list and reserve gaps between entries
> >
> > Changes from v2:
> >   - Patch set rebased to Linux-5.0-rc2
> >
> > Changes from v1:
> >   - Addressed Oza review comments.
> >
> > Srinath Mannam (3):
> >   PCI: Add dma_ranges window list
> >   iommu/dma: Reserve IOVA for PCIe inaccessible DMA address
> >   PCI: iproc: Add sorted dma ranges resource entries to host bridge
> >
> >  drivers/iommu/dma-iommu.c           | 35 ++++++++++++++++++++++++++---
> >  drivers/pci/controller/pcie-iproc.c | 44 ++++++++++++++++++++++++++++++++++++-
> >  drivers/pci/probe.c                 |  3 +++
> >  include/linux/pci.h                 |  1 +
> >  4 files changed, 79 insertions(+), 4 deletions(-)
>
> I have applied the series to pci/iova-dma-ranges, targeting v5.2,
> thanks.
>
> Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
