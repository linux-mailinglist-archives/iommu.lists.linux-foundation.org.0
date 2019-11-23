Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D8107BCE
	for <lists.iommu@lfdr.de>; Sat, 23 Nov 2019 01:01:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 926198751D;
	Sat, 23 Nov 2019 00:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9J1y9lnT90Pt; Sat, 23 Nov 2019 00:01:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9484874AF;
	Sat, 23 Nov 2019 00:01:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C5FCC18DA;
	Sat, 23 Nov 2019 00:01:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 316C1C18DA;
 Sat, 23 Nov 2019 00:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 278D6874AF;
 Sat, 23 Nov 2019 00:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbVwuxHy_0BV; Sat, 23 Nov 2019 00:01:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2F41087516;
 Sat, 23 Nov 2019 00:01:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 16:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,231,1571727600"; d="scan'208";a="290792434"
Received: from jpan9-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.254.71.164])
 by orsmga001.jf.intel.com with ESMTP; 22 Nov 2019 16:01:03 -0800
Date: Fri, 22 Nov 2019 16:01:02 -0800
From: "Jacob Pan (Jun)" <jacob.jun.pan@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RFC 00/13] virtio-iommu on non-devicetree platforms
Message-ID: <20191122160102.00004489@intel.com>
In-Reply-To: <20191122105000.800410-1-jean-philippe@linaro.org>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
Organization: intel
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Cc: virtio-dev@lists.oasis-open.org, kevin.tian@intel.com,
 gregkh@linuxfoundation.org, linux-pci@vger.kernel.org, sudeep.holla@arm.com,
 rjw@rjwysocki.net, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, mst@redhat.com, jacob.jun.pan@intel.com,
 guohanjun@huawei.com, bhelgaas@google.com, jasowang@redhat.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Fri, 22 Nov 2019 11:49:47 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> I'm seeking feedback on multi-platform support for virtio-iommu. At
> the moment only devicetree (DT) is supported and we don't have a
> pleasant solution for other platforms. Once we figure out the topology
> description, x86 support is trivial.
> 
> Since the IOMMU manages memory accesses from other devices, the guest
> kernel needs to initialize the IOMMU before endpoints start issuing
> DMA. It's a solved problem: firmware or hypervisor describes through
> DT or ACPI tables the device dependencies, and probe of endpoints is
> deferred until the IOMMU is probed. But:
> 
> (1) ACPI has one table per vendor (DMAR for Intel, IVRS for AMD and
> IORT for Arm). From my point of view IORT is easier to extend, since
> we just need to introduce a new node type. There are no dependencies
> to Arm in the Linux IORT driver, so it works well with CONFIG_X86.
> 
From my limited understanding, IORT and VIOT is to solve device topology
enumeration only? I am not sure how it can be expanded to cover
information beyond device topology. e.g. DMAR has NUMA information and
root port ATS, I guess they are not used today in the guest but might
be additions in the future.

>     However, there are concerns about other OS vendors feeling
> obligated to implement this new node, so Arm proposed introducing
> another ACPI table, that can wrap any of DMAR, IVRS and IORT to
> extend it with new virtual nodes. A draft of this VIOT table
> specification is available at
> http://jpbrucker.net/virtio-iommu/viot/viot-v5.pdf
> 
>     I'm afraid this could increase fragmentation as guests would need
> to implement or modify their support for all of DMAR, IVRS and IORT.
> If we end up doing VIOT, I suggest limiting it to IORT.
> 
> (2) In addition, there are some concerns about having virtio depend on
>     ACPI or DT. Some hypervisors (Firecracker, QEMU microvm, kvmtool
> x86 [1]) don't currently implement those methods.
> 
>     It was suggested to embed the topology description into the
> device. It can work, as demonstrated at the end of this RFC, with the
>     following limitations:
> 
>     - The topology description must be read before any endpoint
> managed by the IOMMU is probed, and even before the virtio module is
>       loaded. This RFC uses a PCI quirk to manually parse the virtio
>       configuration. It assumes that all endpoints managed by the
> IOMMU are under this same PCI host.
> 

>     - I don't have a solution for the virtio-mmio transport at the
>       moment, because I haven't had time to modify a host to test it.
> I think it could either use a notifier on the platform bus, or
>       better, a new 'iommu' command-line argument to the virtio-mmio
>       driver. So the current prototype doesn't work for firecracker
> and microvm, which rely on virtio-mmio.
> 
>     - For Arm, if the platform has an ITS, the hypervisor needs IORT
> or DT to describe it anyway. More generally, not using either ACPI or
>       DT might prevent from supporting other features as well. I
> suspect the above users will have to implement a standard method
> sooner or later.
> 
>     - Even when reusing as much existing code as possible, guest
> support is still going to be around a few hundred lines since we can't
>       rely on the normal virtio infrastructure to be loaded at that
>       point. As you can see below, the diffstat for the incomplete
>       topology implementation is already bigger than the exhaustive
> IORT support, even when jumping through the VIOT hoop.
> 
>     So it's a lightweight solution for very specific use-cases, and we
>     should still support ACPI for the general case. Multi-platform
>     guests such as Linux will then need to support three topology
>     descriptions instead of two.
> 
> In this RFC I present both solutions, but I'd rather not keep all of
> it. Please see the individual patches for details:
> 
> (1) Patches 1, 3-10 add support for virtio-iommu to the Linux IORT
>     driver and patches 2, 11 add the VIOT glue.
> 
> (2) Patch 12 adds the built-in topology description to the
> virtio-iommu specification. Patch 13 is a partial implementation for
> the Linux virtio-iommu driver. It only supports PCI, not platform
> devices.
> 
> You can find Linux and QEMU code on my virtio-iommu/devel branches at
> http://jpbrucker.net/git/linux and http://jpbrucker.net/git/qemu
> 
> 
> I split the diffstat since there are two independent features. The
> first one is for patches 1-11, and the second one for patch 13.
> 
> Jean-Philippe Brucker (11):
>   ACPI/IORT: Move IORT to the ACPI folder
>   ACPI: Add VIOT definitions
>   ACPI/IORT: Allow registration of external tables
>   ACPI/IORT: Add node categories
>   ACPI/IORT: Support VIOT virtio-mmio node
>   ACPI/IORT: Support VIOT virtio-pci node
>   ACPI/IORT: Defer probe until virtio-iommu-pci has registered a
> fwnode ACPI/IORT: Add callback to update a device's fwnode
>   iommu/virtio: Create fwnode if necessary
>   iommu/virtio: Update IORT fwnode
>   ACPI: Add VIOT table
> 
>  MAINTAINERS                     |   9 +
>  drivers/acpi/Kconfig            |   7 +
>  drivers/acpi/Makefile           |   2 +
>  drivers/acpi/arm64/Kconfig      |   3 -
>  drivers/acpi/arm64/Makefile     |   1 -
>  drivers/acpi/bus.c              |   2 +
>  drivers/acpi/{arm64 => }/iort.c | 317
> ++++++++++++++++++++++++++------ drivers/acpi/tables.c           |
> 2 +- drivers/acpi/viot.c             |  44 +++++
>  drivers/iommu/Kconfig           |   1 +
>  drivers/iommu/virtio-iommu.c    |  61 +++++-
>  include/acpi/actbl2.h           |  31 ++++
>  include/linux/acpi_iort.h       |  14 ++
>  include/linux/acpi_viot.h       |  20 ++
>  14 files changed, 448 insertions(+), 66 deletions(-)
>  rename drivers/acpi/{arm64 => }/iort.c (86%)
>  create mode 100644 drivers/acpi/viot.c
>  create mode 100644 include/linux/acpi_viot.h
> 
> Jean-Philippe Brucker (1):
>   iommu/virtio: Add topology description to virtio-iommu config space
> 
>  drivers/base/platform.c               |   3 +
>  drivers/iommu/Kconfig                 |   9 +
>  drivers/iommu/Makefile                |   1 +
>  drivers/iommu/virtio-iommu-topology.c | 410
> ++++++++++++++++++++++++++ drivers/iommu/virtio-iommu.c          |
> 3 + drivers/pci/pci-driver.c              |   3 +
>  include/linux/virtio_iommu.h          |  18 ++
>  include/uapi/linux/virtio_iommu.h     |  26 ++
>  8 files changed, 473 insertions(+)
>  create mode 100644 drivers/iommu/virtio-iommu-topology.c
>  create mode 100644 include/linux/virtio_iommu.h
> 
> 
> [1] firecracker: https://github.com/firecracker-microvm/firecracker
>     microvm: https://github.com/qemu/qemu/blob/master/docs/microvm.rst
>     kvmtool:
> https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
