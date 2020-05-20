Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9191DBCCC
	for <lists.iommu@lfdr.de>; Wed, 20 May 2020 20:27:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E36F7882C5;
	Wed, 20 May 2020 18:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJVkBJJZ0IwD; Wed, 20 May 2020 18:27:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68DDD882AC;
	Wed, 20 May 2020 18:27:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55AD3C0176;
	Wed, 20 May 2020 18:27:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3680CC0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 18:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2123522744
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 18:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITKTmEYt8cX7 for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 18:26:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id DB665203D5
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 18:26:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w64so3904339wmg.4
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Y/fdBR4NjwtQDCcpCctgOyCn9js/D87HSWqbK2WjCk=;
 b=X4Dyq5Ze9JCoNjG3KsaNqU1dDeKCUMh00Xiz7+8OVNwUiocD0n54uYbDAPqVAc+JPG
 2jr4mRkAj3MRIH3H62IPk0SHcRtbUooIhrXZjOW4OXNF4scXgT5ySHRquY+Lgb61+whu
 mXsmvrHLfNQ3Jh8mB2zUaH1Hmo2Kd1wMnxKJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Y/fdBR4NjwtQDCcpCctgOyCn9js/D87HSWqbK2WjCk=;
 b=XcwQFN81sXVwoZsOViftoYz3CcR/DrHlhDzQ5Xnw6tHaeddHLb/tYt6dszyQk4YlKo
 jwoGwnaKuxRG6Xz3ixjON11d1sqGLZVDS+HfBc+p9ZI81Z2nlnJVuZWWIXRrjPny9EtI
 75j+Q+Lh+YLcWOxBbOxSGbtu6tfw9s4cLQSh9IcGvZwSvBmqyRkkIOI+aj27XVbxi2xg
 P3s48cx9bz/gsvSmGiTE1/JqUiPz3L/CiCivwA8o2Ou0kIphK7+pz2PUTe7FkfrGsf3X
 iD6TJLxLgahsjQFkhRLFQFIEZC6gNWKmqNhX5d/7VYkbTevZ4C+TQn1cXeOASrpbhGG4
 EA2Q==
X-Gm-Message-State: AOAM533+AH3RiuEJkuPvxjkii1300K6lIHcB3uzqleiIy1tOn7lGGDXa
 A1MVYVi96yObgYhP9OO43g2S+k+ZvKhRSNIWa+/hXg==
X-Google-Smtp-Source: ABdhPJyKeMi9gaTkOXDaBSgAZ5jBfQr9fDEE+1qJ1e9vX2WhhGVEmL6fshDM82dD1DyIM9MqcUXl+6DgXk1CBF0SP+Y=
X-Received: by 2002:a1c:7305:: with SMTP id d5mr5874355wmb.85.1589999217222;
 Wed, 20 May 2020 11:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200519203419.12369-1-james.quinlan@broadcom.com>
 <20200519203419.12369-10-james.quinlan@broadcom.com>
 <20200520174216.GA11770@lst.de>
In-Reply-To: <20200520174216.GA11770@lst.de>
Date: Wed, 20 May 2020 14:26:43 -0400
Message-ID: <CA+-6iNzy_nELB0ptE0vH5KrGMFq4CctFKDipk3ZzXnjnT9hfuQ@mail.gmail.com>
Subject: Re: [PATCH 09/15] device core: Add ability to handle multiple dma
 offsets
To: Christoph Hellwig <hch@lst.de>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Robin Murphy <robin.murphy@arm.com>,
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
From: Jim Quinlan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Sorry, I meant to put you on the to-list for all patches.   The last
time I sent out this many patches using a collective cc-list for all
patches I was told to reduce my cc-list.
Jim

On Wed, May 20, 2020 at 1:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> If you don't Cc me on the whole series I have absolutely no way to
> review it.  Don't ever do these stupid partial Ccs as they cause nothing
> but pain.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
