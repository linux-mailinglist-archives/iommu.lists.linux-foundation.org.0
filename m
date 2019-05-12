Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4B1AD0E
	for <lists.iommu@lfdr.de>; Sun, 12 May 2019 18:32:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74C2BE2A;
	Sun, 12 May 2019 16:32:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EA4D8DD9
	for <iommu@lists.linux-foundation.org>;
	Sun, 12 May 2019 16:32:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0F3A9878
	for <iommu@lists.linux-foundation.org>;
	Sun, 12 May 2019 16:32:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id m32so9118420qtf.0
	for <iommu@lists.linux-foundation.org>;
	Sun, 12 May 2019 09:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=gWQWmUQnTtpdS1fW9lGpRk2GMG2DyCbjfZMrbY3ehBg=;
	b=LCyKBhiqIQzi+1CYdewvLYZcHi1a2ZB3UAxCY1r7B5emDGQKr5xqT2w/s/Ng8Eri35
	aidQ2o7qTn3Z/z0/oF77JoeURH3h/TVwtA3qDIBH/J8+7j9Q2us4HE5+4vCsUQnvrhK5
	GSTaTGlHHam0Z/cYC4TbsGBg9nbIg5xH118JxWoQoMRKEu6T1QOmN9Kqv4Voif8oVodD
	OYRE/X5NxFcJpdWCS0cUcw64CfY4qMidHMxFL1+M3ZF1kkff2Waj2ymuTK5XWaG4r6BO
	GitkI0m2zX+g52V53rZgGD+518oMfc7oLYZXEBN5qqa2cJKzJHRh7Pd7VN52OvfKmEMH
	LnHw==
X-Gm-Message-State: APjAAAU5cEdm8wsEYvZ5y9IMuIAb9lWhbFd1Ia8UKANCku8eG9rlEhVF
	Ovg4EZLcSRjuw7ol8jVhlhrCJg==
X-Google-Smtp-Source: APXvYqzhmWo+UkRgVkqDTpvr2NwI5n1SCQUPFdJ0CANhQ8AuAx0/rktx5J0cdUejuh99dU3DdW4fsQ==
X-Received: by 2002:aed:3fd8:: with SMTP id w24mr20147558qth.64.1557678723231; 
	Sun, 12 May 2019 09:32:03 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	h62sm5582800qkd.92.2019.05.12.09.32.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 12 May 2019 09:32:02 -0700 (PDT)
Date: Sun, 12 May 2019 12:31:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v7 0/7] Add virtio-iommu driver
Message-ID: <20190512123022-mutt-send-email-mst@kernel.org>
References: <20190115121959.23763-1-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115121959.23763-1-jean-philippe.brucker@arm.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, virtio-dev@lists.oasis-open.org, kevin.tian@intel.com,
	tnowicki@caviumnetworks.com, devicetree@vger.kernel.org,
	marc.zyngier@arm.com, linux-pci@vger.kernel.org,
	will.deacon@arm.com, robin.murphy@arm.com,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, robh+dt@kernel.org,
	kvmarm@lists.cs.columbia.edu, bhelgaas@google.com,
	frowand.list@gmail.com, jasowang@redhat.com
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

On Tue, Jan 15, 2019 at 12:19:52PM +0000, Jean-Philippe Brucker wrote:
> Implement the virtio-iommu driver, following specification v0.9 [1].
> 
> This is a simple rebase onto Linux v5.0-rc2. We now use the
> dev_iommu_fwspec_get() helper introduced in v5.0 instead of accessing
> dev->iommu_fwspec, but there aren't any functional change from v6 [2].
> 
> Our current goal for virtio-iommu is to get a paravirtual IOMMU working
> on Arm, and enable device assignment to guest userspace. In this
> use-case the mappings are static, and don't require optimal performance,
> so this series tries to keep things simple. However there is plenty more
> to do for features and optimizations, and having this base in v5.1 would
> be good. Given that most of the changes are to drivers/iommu, I believe
> the driver and future changes should go via the IOMMU tree.
> 
> You can find Linux driver and kvmtool device on v0.9.2 branches [3],
> module and x86 support on virtio-iommu/devel. Also tested with Eric's
> QEMU device [4]. Please note that the series depends on Robin's
> probe-deferral fix [5], which will hopefully land in v5.0.
> 
> [1] Virtio-iommu specification v0.9, sources and pdf
>     git://linux-arm.org/virtio-iommu.git virtio-iommu/v0.9
>     http://jpbrucker.net/virtio-iommu/spec/v0.9/virtio-iommu-v0.9.pdf
> 
> [2] [PATCH v6 0/7] Add virtio-iommu driver
>     https://lists.linuxfoundation.org/pipermail/iommu/2018-December/032127.html
> 
> [3] git://linux-arm.org/linux-jpb.git virtio-iommu/v0.9.2
>     git://linux-arm.org/kvmtool-jpb.git virtio-iommu/v0.9.2
> 
> [4] [RFC v9 00/17] VIRTIO-IOMMU device
>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg575578.html
> 
> [5] [PATCH] iommu/of: Fix probe-deferral
>     https://www.spinics.net/lists/arm-kernel/msg698371.html


OK this has been in next for a while.

Last time IOMMU maintainers objected. Are objections
still in force?

If not could we get acks please?


> Jean-Philippe Brucker (7):
>   dt-bindings: virtio-mmio: Add IOMMU description
>   dt-bindings: virtio: Add virtio-pci-iommu node
>   of: Allow the iommu-map property to omit untranslated devices
>   PCI: OF: Initialize dev->fwnode appropriately
>   iommu: Add virtio-iommu driver
>   iommu/virtio: Add probe request
>   iommu/virtio: Add event queue
> 
>  .../devicetree/bindings/virtio/iommu.txt      |   66 +
>  .../devicetree/bindings/virtio/mmio.txt       |   30 +
>  MAINTAINERS                                   |    7 +
>  drivers/iommu/Kconfig                         |   11 +
>  drivers/iommu/Makefile                        |    1 +
>  drivers/iommu/virtio-iommu.c                  | 1158 +++++++++++++++++
>  drivers/of/base.c                             |   10 +-
>  drivers/pci/of.c                              |    7 +
>  include/uapi/linux/virtio_ids.h               |    1 +
>  include/uapi/linux/virtio_iommu.h             |  161 +++
>  10 files changed, 1449 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/virtio/iommu.txt
>  create mode 100644 drivers/iommu/virtio-iommu.c
>  create mode 100644 include/uapi/linux/virtio_iommu.h
> 
> -- 
> 2.19.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
