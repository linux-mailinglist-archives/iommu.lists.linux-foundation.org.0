Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A831906EF
	for <lists.iommu@lfdr.de>; Tue, 24 Mar 2020 08:58:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C66A84628;
	Tue, 24 Mar 2020 07:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QzYTP0aqn71; Tue, 24 Mar 2020 07:58:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E322F84546;
	Tue, 24 Mar 2020 07:58:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFC1FC0177;
	Tue, 24 Mar 2020 07:58:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2C0AC0177
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 07:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC63984628
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 07:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1R6LffGwLsJz for <iommu@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 07:58:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 63B4B84546
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 07:58:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m3so2355577wmi.0
 for <iommu@lists.linux-foundation.org>; Tue, 24 Mar 2020 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SUCgV3nRs3B1beT4WBt1a1DGebKRN4O92nmyQ5OK76Y=;
 b=LgyC2DJpvNLcteaSmjJJSfmMcT25GgoTdL9bhaN5ozCVuHm4T4A4nn7+xdcZv6R+Fj
 WJ0BONusNO5h8afQhIg/FR/+Cy9VZyNFAxsq/chDfVA1hzZug5mz3TOvSrR8S34YA0u1
 Jtr7anGHUiOdboJonzGFeWa47559XATfI+rxNUewtZ5zo3DfOi3asFbUYJKUsSGfj3Ut
 LOT3F3Zu0qrJlviPZx/fp65FT2YVNFcpknhq0difsFA+jSD0OZr+Wrc63rj5g05j/7Mo
 Fnq4TQNVHXLh3adB8Uzrjngr2D19JNcg0pLndOegnWDDpZbMDCGHOAkDVOhr4ndW4R7o
 Qkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SUCgV3nRs3B1beT4WBt1a1DGebKRN4O92nmyQ5OK76Y=;
 b=p6E0G7N0QlWa+N7u1ZFsok7V3p8/G1xe4gAa/AgkRFIuSQj9xvTAYbQM8026iNoZkW
 GPJXV53suBtuqueGpjxO8RtE95x/xYlgxFQmv6q4TqmnarhbinyY8VoHFE0sZlILjpBg
 9r8TtGgm9zYRjpiT0YlZz2zqQ7Zo7/KLJbRAfTSW3uHmuiZE7YvA9/0bCfe5cZqD2wPv
 bcNOtdJUMWe7AEVKmV1eipPM+RG5eE9XBgBaCKhR1EbfHTQ7ObKPlCmdL9LswJHQ0VpO
 iH91drajfrw2R0mVPzY5FT3eGfw/+jUDJdpZ9zIh0bKTJDjxDP/eMGx+Cx+k9QvFYAIJ
 XXJg==
X-Gm-Message-State: ANhLgQ39fdriDROqwARSTLM7ShrT73CUGuA8n8DGHhYEObMaETPiHi2J
 JkQtrvzsVYXw+Ttp9C4EC+unvw==
X-Google-Smtp-Source: ADFU+vsZDsM2M+zxUSXE/orCDmRIbPaEFTs/Bp05hqWwcafuDRq9+vmiZbQ/kaUmDguPiPRSUEciZQ==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr3976259wma.36.1585036732748;
 Tue, 24 Mar 2020 00:58:52 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 9sm3107946wmo.38.2020.03.24.00.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 00:58:52 -0700 (PDT)
Date: Tue, 24 Mar 2020 08:58:45 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [EXT] Re: [PATCH RFC] iommu/virtio: Use page size bitmap
 supported by endpoint
Message-ID: <20200324075845.GB2173442@myrica>
References: <20200323084108.1721-1-bbhushan2@marvell.com>
 <20200323095943.GA2038940@myrica>
 <MWHPR1801MB196689B3880CD9316942A2B8E3F00@MWHPR1801MB1966.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR1801MB196689B3880CD9316942A2B8E3F00@MWHPR1801MB1966.namprd18.prod.outlook.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
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

On Mon, Mar 23, 2020 at 05:25:17PM +0000, Bharat Bhushan wrote:
> Hi Jean,
> 
> > -----Original Message-----
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Sent: Monday, March 23, 2020 3:30 PM
> > To: Bharat Bhushan <bbhushan2@marvell.com>
> > Cc: joro@8bytes.org; mst@redhat.com; jasowang@redhat.com;
> > virtualization@lists.linux-foundation.org; iommu@lists.linux-foundation.org;
> > eric.auger@redhat.com
> > Subject: [EXT] Re: [PATCH RFC] iommu/virtio: Use page size bitmap supported by
> > endpoint
> > 
> > External Email
> > 
> > ----------------------------------------------------------------------
> > Hi Bharat,
> > 
> > Please add the IOMMU list on your next posting
> 
> iommu@lists.linux-foundation.org is there, any other mailing list we need to add?

I added that address when replying :) It doesn't look like your patch
reached the list:
https://lore.kernel.org/linux-iommu/20200323095943.GA2038940@myrica/T/
But virtualization and iommu lists are enough.

Thanks,
Jean

> 
> > 
> > On Mon, Mar 23, 2020 at 02:11:08PM +0530, Bharat Bhushan wrote:
> > > Different endpoint can support different page size, probe endpoint if
> > > it supports specific page size otherwise use global page sizes.
> > >
> > > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > > ---
> > >  drivers/iommu/virtio-iommu.c      | 24 ++++++++++++++++++++----
> > >  include/uapi/linux/virtio_iommu.h |  6 ++++++
> > >  2 files changed, 26 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/iommu/virtio-iommu.c
> > > b/drivers/iommu/virtio-iommu.c index cce329d71fba..e69347ca4ee6 100644
> > > --- a/drivers/iommu/virtio-iommu.c
> > > +++ b/drivers/iommu/virtio-iommu.c
> > > @@ -78,6 +78,7 @@ struct viommu_endpoint {
> > >  	struct viommu_dev		*viommu;
> > >  	struct viommu_domain		*vdomain;
> > >  	struct list_head		resv_regions;
> > > +	u64				pgsize_bitmap;
> > >  };
> > >
> > >  struct viommu_request {
> > > @@ -415,6 +416,14 @@ static int viommu_replay_mappings(struct
> > viommu_domain *vdomain)
> > >  	return ret;
> > >  }
> > >
> > > +static int viommu_set_pgsize_bitmap(struct viommu_endpoint *vdev,
> > > +				    struct virtio_iommu_probe_pgsize_mask *mask)
> > > +
> > > +{
> > > +	vdev->pgsize_bitmap = mask->pgsize_bitmap;
> > 
> > We need to read this through le64_to_cpu(). Also check that the length of the field
> > provided by the device is >= sizeof(mask) (like
> > viommu_add_resv_mem() does)
> 
> Will take care of all the comments in next verions
> 
> Thank
> -Bharat
> 
> > 
> > > +	return 0;
> > > +}
> > > +
> > >  static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
> > >  			       struct virtio_iommu_probe_resv_mem *mem,
> > >  			       size_t len)
> > > @@ -494,11 +503,13 @@ static int viommu_probe_endpoint(struct viommu_dev
> > *viommu, struct device *dev)
> > >  	while (type != VIRTIO_IOMMU_PROBE_T_NONE &&
> > >  	       cur < viommu->probe_size) {
> > >  		len = le16_to_cpu(prop->length) + sizeof(*prop);
> > > -
> > >  		switch (type) {
> > >  		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
> > >  			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
> > >  			break;
> > > +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> > > +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop);
> > > +			break;
> > >  		default:
> > >  			dev_err(dev, "unknown viommu prop 0x%x\n", type);
> > >  		}
> > > @@ -607,16 +618,21 @@ static struct iommu_domain
> > *viommu_domain_alloc(unsigned type)
> > >  	return &vdomain->domain;
> > >  }
> > >
> > > -static int viommu_domain_finalise(struct viommu_dev *viommu,
> > > +static int viommu_domain_finalise(struct viommu_endpoint *vdev,
> > >  				  struct iommu_domain *domain)
> > >  {
> > >  	int ret;
> > >  	struct viommu_domain *vdomain = to_viommu_domain(domain);
> > > +	struct viommu_dev *viommu = vdev->viommu;
> > >
> > >  	vdomain->viommu		= viommu;
> > >  	vdomain->map_flags	= viommu->map_flags;
> > >
> > > -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> > > +	if (vdev->pgsize_bitmap)
> > > +		domain->pgsize_bitmap = vdev->pgsize_bitmap;
> > > +	else
> > > +		domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> > > +
> > 
> > nit: it could be nicer to initialize vdev->pgsize_bitmap in add_device(), override it
> > in probe_endpoint(), and just copy it here.
> > 
> > >  	domain->geometry	= viommu->geometry;
> > >
> > >  	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain, @@
> > > -657,7 +673,7 @@ static int viommu_attach_dev(struct iommu_domain
> > *domain, struct device *dev)
> > >  		 * Properly initialize the domain now that we know which viommu
> > >  		 * owns it.
> > >  		 */
> > > -		ret = viommu_domain_finalise(vdev->viommu, domain);
> > > +		ret = viommu_domain_finalise(vdev, domain);
> > 
> > Attaching additional endpoints with different masks to the domain should return
> > an error
> > 
> > >  	} else if (vdomain->viommu != vdev->viommu) {
> > >  		dev_err(dev, "cannot attach to foreign vIOMMU\n");
> > >  		ret = -EXDEV;
> > > diff --git a/include/uapi/linux/virtio_iommu.h
> > > b/include/uapi/linux/virtio_iommu.h
> > > index 237e36a280cb..aff3db0ef54b 100644
> > > --- a/include/uapi/linux/virtio_iommu.h
> > > +++ b/include/uapi/linux/virtio_iommu.h
> > > @@ -111,6 +111,7 @@ struct virtio_iommu_req_unmap {
> > >
> > >  #define VIRTIO_IOMMU_PROBE_T_NONE		0
> > >  #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
> > > +#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
> > >
> > >  #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
> > >
> > > @@ -119,6 +120,11 @@ struct virtio_iommu_probe_property {
> > >  	__le16					length;
> > >  };
> > >
> > > +struct virtio_iommu_probe_pgsize_mask {
> > > +	struct virtio_iommu_probe_property	head;
> > 
> > Compilers will introduce 4 bytes of padding here, to align the next field.
> > We need to make them explicit by adding a 4-bytes 'reserved' field.
> > 
> > > +	uint64_t				pgsize_bitmap;
> > 
> > __le64
> > 
> > Thanks,
> > Jean
> > 
> > > +};
> > > +
> > >  #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
> > >  #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
> > >
> > > --
> > > 2.17.1
> > >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
