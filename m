Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A537E12714
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 07:24:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B883384B;
	Fri,  3 May 2019 05:24:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 837073798
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 05:23:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B27D8D
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 05:23:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a9so6143543wrp.6
	for <iommu@lists.linux-foundation.org>;
	Thu, 02 May 2019 22:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H1qQYH7tPt7jsat6OhfoYkLY0saO1MlrUfkH+20y6CI=;
	b=gHPEpMq5SbxEaF8BgzlPYLqvHA0Xs0e+H7vCBe37Bpo1hmv5y3vUVgmjk3OWnZg48e
	iF/Zd7sDGj9kix7nzGUU6bYw4YBXhcED/Zlw4LSCScbdg8COyROyntbXJwbUF6x6zNwH
	TXrsSVkL360TI3iBtZ+X3arRalxuN/hk5Mjog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H1qQYH7tPt7jsat6OhfoYkLY0saO1MlrUfkH+20y6CI=;
	b=YLFvkpr9UERgOcnyMuiKVsxXmtLIZgMnKdlchJr8coChL6E3ZEqq6AZywGgD/xd416
	Gfudg2+2KoPVHD/f2nx3xq/UCOEI5BIznvul58q0zLEOwxKkOuShNWwwBle9yl62RZaa
	mzEpPLQMrRsVxLlVJbRf4jcYStETkNI3msPbZT3ZmNh0fDC7XpGJiKbl2MHL4p3ChrDz
	TOlMNenT7OrzEUmWVoeDLxnsKTK+3Q2J/1PWoiJWRcMpExLdxPTfB8M3iiU4pRN+RsVu
	INhRIOX1UtWDZ+yIRg2/DutDwAf84I6KNuECwbEPTvvHd36knaZ9jhi0aATntpwRoGvX
	7Ajg==
X-Gm-Message-State: APjAAAUVV/xJeNXJxtBwM5S57vkjH6ZfFzl9mYI2TMdwkTG4xWvtIlVu
	9SQjAK/iH7hX1Ps4aeSOzRKS0YnlNeRgfBtP6+Zcyg==
X-Google-Smtp-Source: APXvYqy71CVtzyQPQlcU9T5soozTEHDGQOUQ22gylCRxZU5ROdKL6Io3MB0zFvL0+L7kKojjyNKBGif7XY8/a/HVRnw=
X-Received: by 2002:a5d:4fc3:: with SMTP id h3mr5709670wrw.54.1556861014902;
	Thu, 02 May 2019 22:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <1556732186-21630-1-git-send-email-srinath.mannam@broadcom.com>
	<1556732186-21630-3-git-send-email-srinath.mannam@broadcom.com>
	<20190502110152.GA7313@e121166-lin.cambridge.arm.com>
	<2f4b9492-0caf-d6e3-e727-e3c869eefb58@arm.com>
	<20190502130624.GA10470@e121166-lin.cambridge.arm.com>
	<b4420901-60d4-69ab-6ed0-5d2fa9449595@arm.com>
In-Reply-To: <b4420901-60d4-69ab-6ed0-5d2fa9449595@arm.com>
Date: Fri, 3 May 2019 10:53:23 +0530
Message-ID: <CABe79T7CgtLG=DZTFy8efVocPMLi-MDtyUT5rToy7xj8GHkBSA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] iommu/dma: Reserve IOVA for PCIe inaccessible DMA
	address
To: Robin Murphy <robin.murphy@arm.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: poza@codeaurora.org, Ray Jui <rjui@broadcom.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org,
	BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
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

Hi Robin, Lorenzo,

Thanks for review and guidance.
AFAIU, conclusion of discussion is, to return error if dma-ranges list
is not sorted.

So that, Can I send a new patch with below change to return error if
dma-ranges list is not sorted?

-static void iova_reserve_pci_windows(struct pci_dev *dev,
+static int iova_reserve_pci_windows(struct pci_dev *dev,
                struct iova_domain *iovad)
 {
        struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
@@ -227,11 +227,15 @@ static void iova_reserve_pci_windows(struct pci_dev *dev,
        resource_list_for_each_entry(window, &bridge->dma_ranges) {
                end = window->res->start - window->offset;
 resv_iova:
-               if (end - start) {
+               if (end > start) {
                        lo = iova_pfn(iovad, start);
                        hi = iova_pfn(iovad, end);
                        reserve_iova(iovad, lo, hi);
+               } else {
+                       dev_err(&dev->dev, "Unsorted dma_ranges list\n");
+                       return -EINVAL;
                }
+

Please provide your inputs if any more changes required. Thank you,

Regards,
Srinath.

On Thu, May 2, 2019 at 7:45 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 02/05/2019 14:06, Lorenzo Pieralisi wrote:
> > On Thu, May 02, 2019 at 12:27:02PM +0100, Robin Murphy wrote:
> >> Hi Lorenzo,
> >>
> >> On 02/05/2019 12:01, Lorenzo Pieralisi wrote:
> >>> On Wed, May 01, 2019 at 11:06:25PM +0530, Srinath Mannam wrote:
> >>>> dma_ranges field of PCI host bridge structure has resource entries in
> >>>> sorted order of address range given through dma-ranges DT property. This
> >>>> list is the accessible DMA address range. So that this resource list will
> >>>> be processed and reserve IOVA address to the inaccessible address holes in
> >>>> the list.
> >>>>
> >>>> This method is similar to PCI IO resources address ranges reserving in
> >>>> IOMMU for each EP connected to host bridge.
> >>>>
> >>>> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> >>>> Based-on-patch-by: Oza Pawandeep <oza.oza@broadcom.com>
> >>>> Reviewed-by: Oza Pawandeep <poza@codeaurora.org>
> >>>> Acked-by: Robin Murphy <robin.murphy@arm.com>
> >>>> ---
> >>>>    drivers/iommu/dma-iommu.c | 19 +++++++++++++++++++
> >>>>    1 file changed, 19 insertions(+)
> >>>>
> >>>> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> >>>> index 77aabe6..da94844 100644
> >>>> --- a/drivers/iommu/dma-iommu.c
> >>>> +++ b/drivers/iommu/dma-iommu.c
> >>>> @@ -212,6 +212,7 @@ static void iova_reserve_pci_windows(struct pci_dev *dev,
> >>>>            struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
> >>>>            struct resource_entry *window;
> >>>>            unsigned long lo, hi;
> >>>> +  phys_addr_t start = 0, end;
> >>>>            resource_list_for_each_entry(window, &bridge->windows) {
> >>>>                    if (resource_type(window->res) != IORESOURCE_MEM)
> >>>> @@ -221,6 +222,24 @@ static void iova_reserve_pci_windows(struct pci_dev *dev,
> >>>>                    hi = iova_pfn(iovad, window->res->end - window->offset);
> >>>>                    reserve_iova(iovad, lo, hi);
> >>>>            }
> >>>> +
> >>>> +  /* Get reserved DMA windows from host bridge */
> >>>> +  resource_list_for_each_entry(window, &bridge->dma_ranges) {
> >>>
> >>> If this list is not sorted it seems to me the logic in this loop is
> >>> broken and you can't rely on callers to sort it because it is not a
> >>> written requirement and it is not enforced (you know because you
> >>> wrote the code but any other developer is not supposed to guess
> >>> it).
> >>>
> >>> Can't we rewrite this loop so that it does not rely on list
> >>> entries order ?
> >>
> >> The original idea was that callers should be required to provide a sorted
> >> list, since it keeps things nice and simple...
> >
> > I understand, if it was self-contained in driver code that would be fine
> > but in core code with possible multiple consumers this must be
> > documented/enforced, somehow.
> >
> >>> I won't merge this series unless you sort it, no pun intended.
> >>>
> >>> Lorenzo
> >>>
> >>>> +          end = window->res->start - window->offset;
> >>
> >> ...so would you consider it sufficient to add
> >>
> >>              if (end < start)
> >>                      dev_err(...);
> >
> > We should also revert any IOVA reservation we did prior to this
> > error, right ?
>
> I think it would be enough to propagate an error code back out through
> iommu_dma_init_domain(), which should then end up aborting the whole
> IOMMU setup - reserve_iova() isn't really designed to be undoable, but
> since this is the kind of error that should only ever be hit during
> driver or DT development, as long as we continue booting such that the
> developer can clearly see what's gone wrong, I don't think we need
> bother spending too much effort tidying up inside the unused domain.
>
> > Anyway, I think it is best to ensure it *is* sorted.
> >
> >> here, plus commenting the definition of pci_host_bridge::dma_ranges
> >> that it must be sorted in ascending order?
> >
> > I don't think that commenting dma_ranges would help much, I am more
> > keen on making it work by construction.
> >
> >> [ I guess it might even make sense to factor out the parsing and list
> >> construction from patch #3 into an of_pci core helper from the beginning, so
> >> that there's even less chance of another driver reimplementing it
> >> incorrectly in future. ]
> >
> > This makes sense IMO and I would like to take this approach if you
> > don't mind.
>
> Sure - at some point it would be nice to wire this up to
> pci-host-generic for Juno as well (with a parallel version for ACPI
> _DMA), so from that viewpoint, the more groundwork in place the better :)
>
> Thanks,
> Robin.
>
> >
> > Either this or we move the whole IOVA reservation and dma-ranges
> > parsing into PCI IProc.
> >
> >> Failing that, although I do prefer the "simple by construction"
> >> approach, I'd have no objection to just sticking a list_sort() call in
> >> here instead, if you'd rather it be entirely bulletproof.
> >
> > I think what you outline above is a sensible way forward - if we
> > miss the merge window so be it.
> >
> > Thanks,
> > Lorenzo
> >
> >> Robin.
> >>
> >>>> +resv_iova:
> >>>> +          if (end - start) {
> >>>> +                  lo = iova_pfn(iovad, start);
> >>>> +                  hi = iova_pfn(iovad, end);
> >>>> +                  reserve_iova(iovad, lo, hi);
> >>>> +          }
> >>>> +          start = window->res->end - window->offset + 1;
> >>>> +          /* If window is last entry */
> >>>> +          if (window->node.next == &bridge->dma_ranges &&
> >>>> +              end != ~(dma_addr_t)0) {
> >>>> +                  end = ~(dma_addr_t)0;
> >>>> +                  goto resv_iova;
> >>>> +          }
> >>>> +  }
> >>>>    }
> >>>>    static int iova_reserve_iommu_regions(struct device *dev,
> >>>> --
> >>>> 2.7.4
> >>>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
