Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070925DDBE
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 17:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C7328755F;
	Fri,  4 Sep 2020 15:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PHBTuDbs8nmN; Fri,  4 Sep 2020 15:30:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AB7087564;
	Fri,  4 Sep 2020 15:30:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54561C0895;
	Fri,  4 Sep 2020 15:30:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32615C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 15:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E9858754D
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 15:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8MgilTds8lS for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 15:30:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DE1888755E
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599233402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRdDsTplpUOo4libxw8O1Q2NtW0tDZkh0RhwSXPBuqI=;
 b=PSgh5u3JFDWB80luhfaVSp+nVtZW4kZASX+qQNCuJvs+Kg705eIlHIEAKkWV2gTchlMlSA
 0TS5gzXH9sRa42td9TtLnF6rE757sndh+S/roIpxMwMLHhVjs/+yYa9JnoNgqFqeXWbObM
 RiaTbNB8BpkztOAeNIFSXEVnNAoUhyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-ubmidy7jMGOZc6NNGDjlUQ-1; Fri, 04 Sep 2020 11:30:00 -0400
X-MC-Unique: ubmidy7jMGOZc6NNGDjlUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90A01029D25;
 Fri,  4 Sep 2020 15:29:58 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD235C1D0;
 Fri,  4 Sep 2020 15:29:55 +0000 (UTC)
Subject: Re: [PATCH v3 1/6] iommu/virtio: Move to drivers/iommu/virtio/
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 virtio-dev@lists.oasis-open.org, linux-pci@vger.kernel.org
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200821131540.2801801-2-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <894aa803-644b-b6f2-2a28-73c388430ac6@redhat.com>
Date: Fri, 4 Sep 2020 17:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200821131540.2801801-2-jean-philippe@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: kevin.tian@intel.com, mst@redhat.com, sebastien.boeuf@intel.com,
 bhelgaas@google.com, jasowang@redhat.com
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

Hi Jean,

On 8/21/20 3:15 PM, Jean-Philippe Brucker wrote:
> Before adding new files to the virtio-iommu driver, move it to its own
> subfolder, similarly to other IOMMU drivers.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/Makefile                    | 3 +--
>  drivers/iommu/virtio/Makefile             | 2 ++
>  drivers/iommu/{ => virtio}/virtio-iommu.c | 0
>  MAINTAINERS                               | 2 +-
>  4 files changed, 4 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/virtio/Makefile
>  rename drivers/iommu/{ => virtio}/virtio-iommu.c (100%)
> 
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 11f1771104f3..fc7523042512 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-y += amd/ intel/ arm/
> +obj-y += amd/ intel/ arm/ virtio/
>  obj-$(CONFIG_IOMMU_API) += iommu.o
>  obj-$(CONFIG_IOMMU_API) += iommu-traces.o
>  obj-$(CONFIG_IOMMU_API) += iommu-sysfs.o
> @@ -26,4 +26,3 @@ obj-$(CONFIG_EXYNOS_IOMMU) += exynos-iommu.o
>  obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
>  obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
>  obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
> -obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
> diff --git a/drivers/iommu/virtio/Makefile b/drivers/iommu/virtio/Makefile
> new file mode 100644
> index 000000000000..279368fcc074
> --- /dev/null
> +++ b/drivers/iommu/virtio/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio/virtio-iommu.c
> similarity index 100%
> rename from drivers/iommu/virtio-iommu.c
> rename to drivers/iommu/virtio/virtio-iommu.c
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb617361..3602b223c9b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18451,7 +18451,7 @@ VIRTIO IOMMU DRIVER
>  M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
>  L:	virtualization@lists.linux-foundation.org
>  S:	Maintained
> -F:	drivers/iommu/virtio-iommu.c
> +F:	drivers/iommu/virtio/
>  F:	include/uapi/linux/virtio_iommu.h
not related to this patch but you may add an entry for
Documentation/devicetree/bindings/virtio/iommu.txt

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  
>  VIRTIO MEM DRIVER
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
