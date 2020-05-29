Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D76281E85A9
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 19:49:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6548488547;
	Fri, 29 May 2020 17:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbPGCpsK9cmC; Fri, 29 May 2020 17:49:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CAAD48853C;
	Fri, 29 May 2020 17:49:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAADDC0892;
	Fri, 29 May 2020 17:49:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB02C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 17:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 44EBC25EC9
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 17:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aC+Gbg2aOWmi for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 17:49:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 8BE6022264
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 17:49:01 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id y5so198236iob.12
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 10:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BLn5568WhOcT6+u2ym9/jBhSyqxnYH4n/L9rj2t60QE=;
 b=Pcoh/puXYWo9Oapwz59/t9tsJOrfkyFIgUfWv5nxnkX70msQKl7iMXsX7rgQpOt5mf
 1+CI58jsoh7Qz1AUk+8Dq7OU94CVgpb8W/rrPXbGZujgOtzITHoGG1HPEDv31t+XyrMk
 k43ynFOnYoY7/nTa8rRTRfnoPHvPmFxZjLGsCWRdAlsnZ+osTI2ALV1lmvegn4LMxqEA
 tIKjuja7dPpjqrYaGRPxUL0pq0SVTFTofKxdM8/2OcfHVuJ8EA08r3rdKKqXHFQf29k4
 DsYCGoLvHy+aMNqdDIPaHylA2kZKipqDVkJU9OfGULWth4pFROAEo5bBGtHDtounoGh6
 akTg==
X-Gm-Message-State: AOAM532zWSx9GE28koUpmi3B9t2/U72Q7c4HXVPvU0xzfKsVxH6zJakz
 UduzBv3YpG1wSd1twQXXjg==
X-Google-Smtp-Source: ABdhPJy7YUF3lpxrD7YMnpI0UvB3HdDPYFVO6rRfufgNQwXAXOB9FeWO8U/8UblJM9K1CPtEmWfdwQ==
X-Received: by 2002:a02:1443:: with SMTP id 64mr2603674jag.43.1590774540749;
 Fri, 29 May 2020 10:49:00 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t22sm4001987iom.49.2020.05.29.10.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 10:49:00 -0700 (PDT)
Received: (nullmailer pid 2643995 invoked by uid 1000);
 Fri, 29 May 2020 17:48:58 -0000
Date: Fri, 29 May 2020 11:48:58 -0600
From: Rob Herring <robh@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v2 00/14] PCI: brcmstb: enable PCIe for STB chips
Message-ID: <20200529174858.GA2640397@bogus>
References: <20200526191303.1492-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526191303.1492-1-james.quinlan@broadcom.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-pci@vger.kernel.org,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Julien Grall <julien.grall@arm.com>,
 Christoph Hellwig <hch@lst.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, Alan Stern <stern@rowland.harvard.edu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Corey Minyard <minyard@acm.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

On Tue, May 26, 2020 at 03:12:39PM -0400, Jim Quinlan wrote:
> v2:
> Commit: "device core: Add ability to handle multiple dma offsets"
>   o Added helper func attach_dma_pfn_offset_map() in address.c (Chistoph)
>   o Helpers funcs added to __phys_to_dma() & __dma_to_phys() (Christoph)
>   o Added warning when multiple offsets are needed and !DMA_PFN_OFFSET_MAP
>   o dev->dma_pfn_map => dev->dma_pfn_offset_map
>   o s/frm/from/ for dma_pfn_offset_frm_{phys,dma}_addr() (Christoph)
>   o In device.h: s/const void */const struct dma_pfn_offset_region */
>   o removed 'unlikely' from unlikely(dev->dma_pfn_offset_map) since
>     guarded by CONFIG_DMA_PFN_OFFSET_MAP (Christoph)
>   o Since dev->dma_pfn_offset is copied in usb/core/{usb,message}.c, now
>     dev->dma_pfn_offset_map is copied as well.
>   o Merged two of the DMA commits into one (Christoph).
> 
> Commit "arm: dma-mapping: Invoke dma offset func if needed":
>   o Use helper functions instead of #if CONFIG_DMA_PFN_OFFSET
> 
> Other commits' changes:
>   o Removed need for carrying of_id var in priv (Nicolas)
>   o Commit message rewordings (Bjorn)
>   o Commit log messages filled to 75 chars (Bjorn)
>   o devm_reset_control_get_shared())
>     => devm_reset_control_get_optional_shared (Philipp)
>   o Add call to reset_control_assert() in PCIe remove routines (Philipp)
> 
> v1:
> This patchset expands the usefulness of the Broadcom Settop Box PCIe
> controller by building upon the PCIe driver used currently by the
> Raspbery Pi.  Other forms of this patchset were submitted by me years
> ago and not accepted; the major sticking point was the code required
> for the DMA remapping needed for the PCIe driver to work [1].
> 
> There have been many changes to the DMA and OF subsystems since that
> time, making a cleaner and less intrusive patchset possible.  This
> patchset implements a generalization of "dev->dma_pfn_offset", except
> that instead of a single scalar offset it provides for multiple
> offsets via a function which depends upon the "dma-ranges" property of
> the PCIe host controller.  This is required for proper functionality
> of the BrcmSTB PCIe controller and possibly some other devices.

If you can enable the h/w support without the multiple offset support, 
then I'd split up this series. The latter part might take a bit more 
time.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
