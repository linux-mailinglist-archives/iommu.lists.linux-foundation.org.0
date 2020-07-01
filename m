Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A3060211506
	for <lists.iommu@lfdr.de>; Wed,  1 Jul 2020 23:23:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44F1F24B59;
	Wed,  1 Jul 2020 21:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsXQP-l6-8rT; Wed,  1 Jul 2020 21:23:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C2A92D08B;
	Wed,  1 Jul 2020 21:23:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22B83C0890;
	Wed,  1 Jul 2020 21:23:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7448C0733
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C69798946D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 21:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EV6_JPJHKOtF for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 21:23:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23A6589252
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593638620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2r4biBmgD4usQWexXh9vBu72j/PA8sqQ6Ual1zjZVg=;
 b=crw6jiU7NhllWsejLks+KSy/+5heCSBlI+u1DNJL2cT6+NItN82GvS+jfs17iRKCIBbGAp
 WyPqN76wPTH65j/okO6O+/uOTgo3EYLtA56qxDTEbJJunIMBrN5a9rpcm5bdgnxjHWgovX
 NdXLwRk8svEcRy+4XpXZbIx0kcEUf48=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-8tdjstEiP2qk5uAo1PtrlQ-1; Wed, 01 Jul 2020 17:23:39 -0400
X-MC-Unique: 8tdjstEiP2qk5uAo1PtrlQ-1
Received: by mail-wr1-f69.google.com with SMTP id o12so22386921wrj.23
 for <iommu@lists.linux-foundation.org>; Wed, 01 Jul 2020 14:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m2r4biBmgD4usQWexXh9vBu72j/PA8sqQ6Ual1zjZVg=;
 b=cAu2+/4oPfMjMtlhELcSHPkm1bhNdb8b976BIp6+I/WokluvpK+TU8HBMsShpJAhOT
 EkLEXafbuACFTE4Jn+f029wn8F5AFSuc9IrZ+paAr5//oARCpEkLJuQk8wvHlfnASgKG
 5jewIdgAyXMNk/Qr0VOOtzLjGVLIW9/U52eTqXrSZzCpA/4V9dE9zG70+2lMPSQ6VAjy
 nK2rnJ3bMBUNI1ODC094nu+sRaGZgJ1C37s2c7kPLZYuZjpIGglLoz7bTVlKae2B99q2
 WewyzRl0bmddZ6clQMVy24nQlduUZ2tsnoSqocW8D0XxzAs788OvhWeojSxsJ6SM+oLs
 MFOQ==
X-Gm-Message-State: AOAM530PXMmEHaTgzKMGBx1gRIzc39ZDd0YOZgLu8dblMlPN15Yt4By1
 4/N17t6Kf/l+2VA2u/HbLpWR4mnpS+vjjavO8R7g6hia+E+o978I48wIYVSPiEdnJ261Qg0jWuk
 qSkEwZmhbd4+mDWdeNRwl4DZhuqA01g==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr28640738wrx.352.1593638618034; 
 Wed, 01 Jul 2020 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ5EOdK3/I7t3hzH2nXxlZ8gKRo3bNG63qK7yosafmw6Hvgwi6pb2IZMrXml3ZBqz0x5VNnw==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr28640715wrx.352.1593638617762; 
 Wed, 01 Jul 2020 14:23:37 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 d63sm8905146wmc.22.2020.07.01.14.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 14:23:35 -0700 (PDT)
Date: Wed, 1 Jul 2020 17:23:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200701172219-mutt-send-email-mst@kernel.org>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> Would you be in favor of a more flexible check along the lines of the
> one proposed in the patch that started this thread:
> 
>     if (xen_vring_use_dma())
>             return true;
> 
> 
> xen_vring_use_dma would be implemented so that it returns true when
> xen_swiotlb is required and false otherwise.

Just to stress - with a patch like this virtio can *still* use DMA API
if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
as you seem to be saying, you guys should fix it before doing something
like this..

-- 
MST

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
