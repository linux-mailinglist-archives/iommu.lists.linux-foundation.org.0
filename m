Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF33B7FE6
	for <lists.iommu@lfdr.de>; Wed, 30 Jun 2021 11:23:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC6783AD1;
	Wed, 30 Jun 2021 09:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7_Mgs27LDc5; Wed, 30 Jun 2021 09:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 63EDE83AD0;
	Wed, 30 Jun 2021 09:23:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BF6DC000E;
	Wed, 30 Jun 2021 09:23:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B4F7C000E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 09:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6761683ACE
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 09:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0SwTuUVanMm for <iommu@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 09:23:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71C1983ACC
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 09:23:43 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id s11so944124ilt.8
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGxHKBuGZkCU1I+kyNcTwBrZAXyCdyYBNGIIT95dpcY=;
 b=PitW6imfDn0IzY3RG7JEiKUR+7Nsn4w2y1bEvPgW/HS2AbzJNtJNRONqnYjnNN01RO
 f4Cy3TS0FXR+ruq1aYhiZGEJMhWbD1l8vF9wU2uLP3NYm94onDiG0L+Sdwsda2NHyvii
 j6adVFIua9Ybkbk/RCb14aonwq2ISknAbeRG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGxHKBuGZkCU1I+kyNcTwBrZAXyCdyYBNGIIT95dpcY=;
 b=MtlRQV7QtD0Etd+cSazsb4HQhXIJXbOdVoC+d3n81KOyxJc1kHi0SJhHFSVZ4BiXFR
 JUmkQbazTFCSzYzWZ9RSKS4EWJB6wo2+hKW6vgXFMigQmelhyvRnmM9ghfvCXX6pydJh
 ae268G0ovR057PuCVcrXcwaTqp16O/bUbAgH3OIX2jaetW1SSYBv8FI3sScVPQN0X16d
 Aer1o6FBLSt/7TvSVkLNPuEKlAQWuQIxkNC4imNysFe1S+1Fd3bCTz/KyvP2e/8ZkckE
 LoLYiBtyimqOb0vBnhnia4bk5heQiUd4EW6kMyzC9jGqkFJQQ8+5kKnHAH6vlQHSuaGz
 GKuA==
X-Gm-Message-State: AOAM5301mqWec7LiDMV0nQFW1l7sZaAOsXlqPfHjSGakX4lGWyiJdsX5
 MfhaXhvcqyY3d7B7l8SPa5rftXJFUMrV1g==
X-Google-Smtp-Source: ABdhPJxtvcy/tkXxUYoQL/2+iHth26nlfMPFD8q3wHFY+oVDAXQEOT194XTSlHF+lXDv8uXlzCHcFg==
X-Received: by 2002:a05:6e02:d04:: with SMTP id
 g4mr23695853ilj.165.1625045022383; 
 Wed, 30 Jun 2021 02:23:42 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id h12sm10827994ila.23.2021.06.30.02.23.42
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 02:23:42 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id i13so2225934ilu.4
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 02:23:42 -0700 (PDT)
X-Received: by 2002:a6b:e013:: with SMTP id z19mr7163972iog.34.1625044658498; 
 Wed, 30 Jun 2021 02:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
In-Reply-To: <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 30 Jun 2021 17:17:27 +0800
X-Gmail-Original-Message-ID: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
Message-ID: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Nathan Chancellor <nathan@kernel.org>
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
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

On Wed, Jun 30, 2021 at 9:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jun 24, 2021 at 11:55:20PM +0800, Claire Chang wrote:
> > Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> > use it to determine whether to bounce the data or not. This will be
> > useful later to allow for different pools.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>
> This patch as commit af452ec1b1a3 ("swiotlb: Use is_swiotlb_force_bounce
> for swiotlb data bouncing") causes my Ryzen 3 4300G system to fail to
> get to an X session consistently (although not every single time),
> presumably due to a crash in the AMDGPU driver that I see in dmesg.
>
> I have attached logs at af452ec1b1a3 and f127c9556a8e and I am happy
> to provide any further information, debug, or test patches as necessary.

Are you using swiotlb=force? or the swiotlb_map is called because of
!dma_capable? (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/dma/direct.h#n93)

`BUG: unable to handle page fault for address: 00000000003a8290` and
the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
(maybe dev->dma_io_tlb_mem) was corrupted?
The dev->dma_io_tlb_mem should be set here
(https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
through device_initialize.

I can't tell what happened from the logs, but maybe we could try KASAN
to see if it provides more clue.

Thanks,
Claire

>
> Cheers,
> Nathan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
