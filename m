Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D195107435
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 15:48:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A798687675;
	Fri, 22 Nov 2019 14:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8qUKBL9GHar; Fri, 22 Nov 2019 14:48:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1525987465;
	Fri, 22 Nov 2019 14:48:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF3FDC18DA;
	Fri, 22 Nov 2019 14:47:59 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 461BEC18DA
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 14:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F434873B6
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 14:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51DecZvoPEE1 for <iommu@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 14:47:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 74A068731C
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 14:47:58 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CA672072D
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574434078;
 bh=EQc/LaSz4eRaJByoiZb2ipCt0IaDpCp3+GhULDtcYWI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FY9hIt7gHlIrXLiJjfTrngT1JuA8auWUoxGefy3wnjz1lUJagg58qQeJDqVu35C5T
 RlXgqOKuIyqzm0XEHPf9wSSS8MfVuP5kY+MEUPElkfNP9bHHk48ESyfcj+mP6Bf/9N
 IxNivswgdnD6gb8XdyvVnW+izOhnPrAqvI1QqlOE=
Received: by mail-qv1-f51.google.com with SMTP id y18so2976487qve.2
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 06:47:58 -0800 (PST)
X-Gm-Message-State: APjAAAUhvSEKnRVta5+H/1qeWaA/6Bw7OPa9tqxkNDFltnQ/nL0mn1jO
 DLSTZdOeNM6wcuJZnTALDdpHIjLr3s3qXm112w==
X-Google-Smtp-Source: APXvYqyhWIT3yYojkaDSRZHcglQ9AlPu/F+glNafGG7BMM/cuqSID3+8L1W2SEkE6TxBfitLGOKJZjTbCwxWZfeti28=
X-Received: by 2002:ad4:42b4:: with SMTP id e20mr3174130qvr.85.1574434077237; 
 Fri, 22 Nov 2019 06:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20191120190028.4722-1-will@kernel.org>
In-Reply-To: <20191120190028.4722-1-will@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Nov 2019 08:47:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJm+6Cg4JfG1EzRMJ2hyPV1O8WbitjGC=XMvZRDD+=OGw@mail.gmail.com>
Message-ID: <CAL_JsqJm+6Cg4JfG1EzRMJ2hyPV1O8WbitjGC=XMvZRDD+=OGw@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for "iommu-map"
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linuxfoundation.org, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Wed, Nov 20, 2019 at 1:00 PM Will Deacon <will@kernel.org> wrote:
>
> Commit 8e12257dead7 ("of: property: Add device link support for iommus,
> mboxes and io-channels") added device link support for IOMMU linkages
> described using the "iommus" property. For PCI devices, this property
> is not present and instead the "iommu-map" property is used on the host
> bridge node to map the endpoint RequesterIDs to their corresponding
> IOMMU instance.
>
> Add support for "iommu-map" to the device link supplier bindings so that
> probing of PCI devices can be deferred until after the IOMMU is
> available.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>
> Applies against driver-core/driver-core-next.
> Tested on AMD Seattle (arm64).

Guess that answers my question whether anyone uses Seattle with DT.
Seattle uses the old SMMU binding, and there's not even an IOMMU
associated with the PCI host. I raise this mainly because the dts
files for Seattle either need some love or perhaps should be removed.

No issues with the patch itself though. I'll queue it after rc1.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
