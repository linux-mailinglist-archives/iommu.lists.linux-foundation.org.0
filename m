Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF42DBAD8
	for <lists.iommu@lfdr.de>; Wed, 16 Dec 2020 06:54:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 783758716A;
	Wed, 16 Dec 2020 05:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9wRUPwtDTbb; Wed, 16 Dec 2020 05:54:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CEF248714C;
	Wed, 16 Dec 2020 05:54:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B10B2C013B;
	Wed, 16 Dec 2020 05:54:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80547C013B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 05:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6748385D4B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 05:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04mPvYgr8lxx for <iommu@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 05:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2A6A285D2B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 05:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608098039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewVDl0C+RgbJNz0cRzPv8vFbjNakQW7eUkZDZ6eWYIo=;
 b=AKQJPfgYNiCmjifecD6vmNik9hb+38T0u5hKvaDlu32x+i1c3vXoJhw5zU6CqdD1uy41VK
 oAv7pyxtxrWwa0scukoZt0K8V+OfgFIjtP3C/VoIHGNjui5Xz0sECrIyalPjpFOn6Lv3Rx
 Y1tEX+vQyCF9T188r5uNxWHl2xIpg7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-zWcatTSPO8Kl-D7u2Ggkbg-1; Wed, 16 Dec 2020 00:53:56 -0500
X-MC-Unique: zWcatTSPO8Kl-D7u2Ggkbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5EB8190A7A2;
 Wed, 16 Dec 2020 05:53:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 107031E5;
 Wed, 16 Dec 2020 05:53:54 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4467818095C9;
 Wed, 16 Dec 2020 05:53:53 +0000 (UTC)
Date: Wed, 16 Dec 2020 00:53:33 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <1330503106.36174346.1608098013639.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201215142755.GB28810@char.us.oracle.com>
References: <d2ae0b1d-332b-42a1-87bf-7da2b749cac2@sect.tu-berlin.de>
 <20201214214950.GC18103@char.us.oracle.com>
 <c3629a27-3590-1d9f-211b-c0b7be152b32@redhat.com>
 <20201215142755.GB28810@char.us.oracle.com>
Subject: Re: swiotlb/virtio: unchecked device dma address and length
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.8]
Thread-Topic: swiotlb/virtio: unchecked device dma address and length
Thread-Index: PEkMXKnONb0rkBpXq/L9SkUhNE40FQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: ashish kalra <ashish.kalra@amd.com>,
 Felicitas Hetzelt <file@sect.tu-berlin.de>,
 Martin Radev <martin.radev@aisec.fraunhofer.de>,
 david kaplan <david.kaplan@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Robert Buhren <robert@sect.tu-berlin.de>, iommu@lists.linux-foundation.org,
 Mathias Morbitzer <mathias.morbitzer@aisec.fraunhofer.de>, hch@lst.de
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



----- Original Message -----
> .snip.
> > > > This raises two issues:
> > > > 1) swiotlb_tlb_unmap_single fails to check whether the index generated
> > > > from the dma_addr is in range of the io_tlb_orig_addr array.
> > > That is fairly simple to implement I would think. That is it can check
> > > that the dma_addr is from the PA in the io_tlb pool when SWIOTLB=force
> > > is used.
> > 
> > 
> > I'm not sure this can fix all the cases. It looks to me we should map
> > descriptor coherent but readonly (which is not supported by current DMA
> > API).
> 
> I think I am missing something obvious here. The attacker is the hypervisor,
> aka
> the owner of the VirtIO device (ring0). The attacker is the one that
> provides the addr/len - having that readonly from a guest perspective
> does not change the fact that the hypervisor can modify the memory range
> by mapping it via a different virtual address in the hypervisor? (aka
> aliasing it).

Right, but if we allow hypervisor to provide arbitrary addr/len, does
it mean hypervisor can read uncrypted content of encrypted memory of
guest through swiotlb?

Thanks

> > 
> > Otherwise, device can modify the desc[i].addr/desc[i].len at any time to
> > pretend a valid mapping.
> 
> With the swiotlb=force as long as addr/len are within the PA boundaries
> within the SWIOTLB pool this should be OK?
> 
> After all that whole area is in cleartext and visible to the attacker.
> 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
