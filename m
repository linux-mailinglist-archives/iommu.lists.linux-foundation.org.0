Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BC278501
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 12:23:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 821AC875C9;
	Fri, 25 Sep 2020 10:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dB74A2eGJJbl; Fri, 25 Sep 2020 10:23:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 134F1875CE;
	Fri, 25 Sep 2020 10:23:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9279C0051;
	Fri, 25 Sep 2020 10:23:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FFCCC0051
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 10:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7EA19875C9
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 10:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovvKfhF3lhv7 for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 10:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AB0D987459
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 10:23:11 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601029390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8U1FHT96w/PLZq5zU9S1B7ShBJVy7YnIM6zbSDnntI=;
 b=ABi7/9SN/Vbj+98I2cHodnBGduC/rxDQkcgFuIsypcDQeAZcYaNMQMVeb2J72ntKmnaA7i
 tO9H39UuvhQBgDWTo2gMuZNh9pFUrfv555cxZnjTi5+d5IyYUYI2vMTb9sOMOovOeoQMlM
 oRMU6k0+5KE+nwMF/QwTxVMMll4rucQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-CkzfZXJ9M2C56g4Ga7mCjg-1; Fri, 25 Sep 2020 06:23:02 -0400
X-MC-Unique: CkzfZXJ9M2C56g4Ga7mCjg-1
Received: by mail-wm1-f71.google.com with SMTP id m125so913522wmm.7
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 03:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N8U1FHT96w/PLZq5zU9S1B7ShBJVy7YnIM6zbSDnntI=;
 b=mlcpfcNBMGdlY1e+oR1WxU4R+zfKegJq+vRs1T9MkFLJqptWO6b4ilP5VFlW1Okjfi
 CqkH0dSt2kVIOXd5aRryQehZcyrgLcQ0I3dmgSxgH1jZzMcB8xaAFcc/7wKuROj1QYjS
 PBorvdHOMfo1bKln+/2BLYQF+9uwHtMYOhzSQQZD0ylNTM963XoUEXFw8tRfVLW4CRLL
 jyxSlI5fG0v0hggEwESm3wakcsI5F/NG6QY963C3SSG+npBDtXGGflFKNaT4FYCBQ/K2
 wrUTkXGUzG8t9NcCswc5nsDuYGg5Yoct2XlmLMTODgKzOqGPq5Ho+5ElO7exkOYpZW+N
 iVIw==
X-Gm-Message-State: AOAM530rYwEusNyzK/9yzD0NcEoz4iol0lBI9iGeHoN7GRKtWWB4Kg5S
 BqF7FGhxAHK72t8yXSeenABz9O2W124sNqVX5q+COGFhFzwPThCh5p0nIdNwuNLk4BIDYJVNV8g
 i10Mzl0t38FqTbchWHBt4pko2mnvtuw==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr3728307wrw.331.1601029381666; 
 Fri, 25 Sep 2020 03:23:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiECiPGTS15kvZqa8R0xHOPr4KjpmYEDueiFgt/xYTRs755Rb+d0YFWnl/vVYKdot5K3D6nQ==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr3728283wrw.331.1601029381484; 
 Fri, 25 Sep 2020 03:23:01 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id d9sm2246590wmb.30.2020.09.25.03.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 03:23:00 -0700 (PDT)
Date: Fri, 25 Sep 2020 06:22:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 0/6] Add virtio-iommu built-in topology
Message-ID: <20200925062230-mutt-send-email-mst@kernel.org>
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200925084806.GB490533@myrica>
MIME-Version: 1.0
In-Reply-To: <20200925084806.GB490533@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, kevin.tian@intel.com,
 linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
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

On Fri, Sep 25, 2020 at 10:48:06AM +0200, Jean-Philippe Brucker wrote:
> On Fri, Aug 21, 2020 at 03:15:34PM +0200, Jean-Philippe Brucker wrote:
> > Add a topology description to the virtio-iommu driver and enable x86
> > platforms.
> > 
> > Since [v2] we have made some progress on adding ACPI support for
> > virtio-iommu, which is the preferred boot method on x86. It will be a
> > new vendor-agnostic table describing para-virtual topologies in a
> > minimal format. However some platforms don't use either ACPI or DT for
> > booting (for example microvm), and will need the alternative topology
> > description method proposed here. In addition, since the process to get
> > a new ACPI table will take a long time, this provides a boot method even
> > to ACPI-based platforms, if only temporarily for testing and
> > development.
> > 
> > v3:
> > * Add patch 1 that moves virtio-iommu to a subfolder.
> > * Split the rest:
> >   * Patch 2 adds topology-helper.c, which will be shared with the ACPI
> >     support.
> >   * Patch 4 adds definitions.
> >   * Patch 5 adds parser in topology.c.
> > * Address other comments.
> > 
> > Linux and QEMU patches available at:
> > https://jpbrucker.net/git/linux virtio-iommu/devel
> > https://jpbrucker.net/git/qemu virtio-iommu/devel
> 
> I'm parking this work again, until we make progress on the ACPI table, or
> until a platform without ACPI and DT needs it. Until then, I've pushed v4
> to my virtio-iommu/topo branch and will keep it rebased on master.
> 
> Thanks,
> Jean

I think you guys need to work on virtio spec too, not too much left to
do there ...

-- 
MST

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
