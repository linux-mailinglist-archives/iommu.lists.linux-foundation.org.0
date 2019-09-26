Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2568BBEC19
	for <lists.iommu@lfdr.de>; Thu, 26 Sep 2019 08:41:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F679BBC;
	Thu, 26 Sep 2019 06:41:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 717CF941
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 06:41:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E18858D
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 06:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1569480105;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=cdl1HGwvODnvSpwLDBUlDn2a4UEfKz3QZ/NK2LE4NIE=;
	b=KTDlYXz2veRP9v4AbP1VpFZM/iRxf55XzqdRm/HRH4N9qSPUkjKBvtBrv3i5FHcJHu6Ehu
	vggl7w3JNebziwCRu34+lr0/NMuKTcLFEjhTOad8ITvVJJpNPKbD2C7vz36NIAVnwHILTi
	Ix8+2b1u4nrZ0NbLLiTqKNkzJ+b09Us=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-elrk3Mj6PT6rlVUos3PpHQ-1; Thu, 26 Sep 2019 02:41:41 -0400
Received: by mail-io1-f70.google.com with SMTP id u18so2817064ioc.4
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 23:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ocy/BNPLMTqOEMeUFdKC8+8ilERJhw6D3aLwzJPoSDk=;
	b=um2hbLgHI9PiupmLpHftmG2XPsp1FEY/EFEjysHmcmssPM0wbgb0p2tJEiTfbYoDg7
	od5udvmNDV8OfYT+d7d1c74TJICl02oXM7ArAk5lPVOmT4MpcJc+GrgfvGiixyvB9f20
	jlBNuSpL02lJAktWjepOzcDWhv7JlvLOwhv1Dd/uX5xm1dXEkNS8ZW4TNB0tOAOHBjo1
	oRdkbhJHtB8dko2pyX3fMBb6xyygsYq5R+ld9rdd9DoEJ+EfJ2gNdrj2f9U1FkFJpwdV
	/CU3N75UYhYoASy+qaXziQkVFph+LtcjhBfG8B2W6W3Di+JD0Maf1CuG4ovV2L6wcGhU
	he8w==
X-Gm-Message-State: APjAAAUKhjheDzf6X0fHF+Mo093lH+7u3PZ6GIj1EKbOUhE762MhNS+E
	dBvyucAo5sRGuyFQbgPTLjZp6tiYdWSZdGHpHT+0rhKbpXuB5YVvyKKfVnlhJd0hNaScWfHmrYt
	VEnGPymvFj0sU0xTm4DSDHsY6QlPrCg==
X-Received: by 2002:a02:b156:: with SMTP id s22mr2201668jah.102.1569480101348; 
	Wed, 25 Sep 2019 23:41:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMAydh5zJla2DIRtUr8J9UKZ3dVBD6fGWa+Z3EwvVdpOipANdfqRJD5HNeuz7D2zOrZfO4WQ==
X-Received: by 2002:a02:b156:: with SMTP id s22mr2201646jah.102.1569480100745; 
	Wed, 25 Sep 2019 23:41:40 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
	by smtp.gmail.com with ESMTPSA id b26sm313635ilb.12.2019.09.25.23.41.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 23:41:39 -0700 (PDT)
Date: Wed, 25 Sep 2019 23:41:38 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 5/6] iommu/amd: Lock dev_data in attach/detach code paths
Message-ID: <20190926064138.numemgo2qc4nch2o@cantor>
References: <20190925132300.3038-1-joro@8bytes.org>
	<20190925132300.3038-6-joro@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20190925132300.3038-6-joro@8bytes.org>
User-Agent: NeoMutt/20180716
X-MC-Unique: elrk3Mj6PT6rlVUos3PpHQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Filippo Sironi <sironi@amazon.de>, iommu@lists.linux-foundation.org,
	jroedel@suse.de
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed Sep 25 19, Joerg Roedel wrote:
>From: Joerg Roedel <jroedel@suse.de>
>
>Make sure that attaching a detaching a device can't race against each
>other and protect the iommu_dev_data with a spin_lock in these code
>paths.
>
>Fixes: 92d420ec028d ("iommu/amd: Relax locking in dma_ops path")
>Signed-off-by: Joerg Roedel <jroedel@suse.de>
>---
> drivers/iommu/amd_iommu.c       | 9 +++++++++
> drivers/iommu/amd_iommu_types.h | 3 +++
> 2 files changed, 12 insertions(+)
>
>diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
>index 459247c32dc0..bac4e20a5919 100644
>--- a/drivers/iommu/amd_iommu.c
>+++ b/drivers/iommu/amd_iommu.c
>@@ -201,6 +201,7 @@ static struct iommu_dev_data *alloc_dev_data(u16 devid)
> 	if (!dev_data)
> 		return NULL;
>
>+	spin_lock_init(&dev_data->lock);
> 	dev_data->devid = devid;
> 	ratelimit_default_init(&dev_data->rs);
>
>@@ -2157,6 +2158,8 @@ static int attach_device(struct device *dev,
>
> 	dev_data = get_dev_data(dev);
>
>+	spin_lock(&dev_data->lock);
>+
> 	ret = -EBUSY;
> 	if (dev_data->domain != NULL)
> 		goto out;
>@@ -2199,6 +2202,8 @@ static int attach_device(struct device *dev,
> 	domain_flush_complete(domain);
>
> out:
>+	spin_unlock(&dev_data->lock);
>+
> 	spin_unlock_irqrestore(&domain->lock, flags);
>
> 	return ret;
>@@ -2218,6 +2223,8 @@ static void detach_device(struct device *dev)
>
> 	spin_lock_irqsave(&domain->lock, flags);
>
>+	spin_lock(&dev_data->lock);
>+
> 	/*
> 	 * First check if the device is still attached. It might already
> 	 * be detached from its domain because the generic
>@@ -2240,6 +2247,8 @@ static void detach_device(struct device *dev)
> 	dev_data->ats.enabled = false;
>
> out:
>+	spin_unlock(&dev_data->lock);
>+
> 	spin_unlock_irqrestore(&domain->lock, flags);
> }
>
>diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
>index 0186501ab971..c9c1612d52e0 100644
>--- a/drivers/iommu/amd_iommu_types.h
>+++ b/drivers/iommu/amd_iommu_types.h
>@@ -633,6 +633,9 @@ struct devid_map {
>  * This struct contains device specific data for the IOMMU
>  */
> struct iommu_dev_data {
>+	/*Protect against attach/detach races */
>+	spinlock_t lock;
>+
> 	struct list_head list;		  /* For domain->dev_list */
> 	struct llist_node dev_data_list;  /* For global dev_data_list */
> 	struct protection_domain *domain; /* Domain the device is bound to */
>-- 
>2.17.1
>
>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
