Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871F2A0C09
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 18:02:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C94718746B;
	Fri, 30 Oct 2020 17:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pN-yoJMR2X-G; Fri, 30 Oct 2020 17:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5EA9587446;
	Fri, 30 Oct 2020 17:02:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55AA0C0051;
	Fri, 30 Oct 2020 17:02:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99FA3C0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 17:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 90682867E8
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 17:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2g25x2TuTtd for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 17:02:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A4ABE86672
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604077363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heAoO8vJI0LuOEKNNcuQJaZtkMbQJQagUyG1mLKCrwU=;
 b=I6aAB/v2SLvc+N2kVFb9Txkvlg1JbshFomTX+xfHY4JOqQmjYwb8tlGhti3UhfoVqMPBMO
 pr+wNXhfLsBu7pLx6Cksg349Brydv93/+lNm5O9qDu3FfsRdbQrQJHiOrF9BdqO+fxk15K
 ty5c1SUn3QSc9Lt+yvnh9+JtLrQfFQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-qC1xMEi7OcS_LorT23wBGA-1; Fri, 30 Oct 2020 13:02:39 -0400
X-MC-Unique: qC1xMEi7OcS_LorT23wBGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 437AE802EDA;
 Fri, 30 Oct 2020 17:02:37 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D59719656;
 Fri, 30 Oct 2020 17:02:36 +0000 (UTC)
Date: Fri, 30 Oct 2020 11:02:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 1/5] vfio/mdev: Register mdev bus earlier during boot
Message-ID: <20201030110235.0229654c@w520.home>
In-Reply-To: <20201030045809.957927-2-baolu.lu@linux.intel.com>
References: <20201030045809.957927-1-baolu.lu@linux.intel.com>
 <20201030045809.957927-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, 30 Oct 2020 12:58:05 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Move mdev bus registration earlier than IOMMU probe processing so that
> the IOMMU drivers could be able to set iommu_ops for the mdev bus. This
> only applies when vfio-mdev module is setected to be built-in.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---

Most kernels will build this as a module, so having different behavior
and apparently different IOMMU support for built-in vs module is
broken.  Thanks,

Alex

>  drivers/vfio/mdev/mdev_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
> index b558d4cfd082..6b9ab71f89e7 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c
> @@ -417,8 +417,12 @@ static void __exit mdev_exit(void)
>  	mdev_bus_unregister();
>  }
>  
> +#if IS_BUILTIN(CONFIG_VFIO_MDEV)
> +postcore_initcall(mdev_init)
> +#else
>  module_init(mdev_init)
>  module_exit(mdev_exit)
> +#endif /* IS_BUILTIN(CONFIG_VFIO_MDEV) */
>  
>  MODULE_VERSION(DRIVER_VERSION);
>  MODULE_LICENSE("GPL v2");

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
