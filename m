Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6121DC21C
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 00:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B61B246FD;
	Wed, 20 May 2020 22:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnr8N8sSWZT2; Wed, 20 May 2020 22:36:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 65401204AE;
	Wed, 20 May 2020 22:36:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47294C0894;
	Wed, 20 May 2020 22:36:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 366DEC0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 22:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2466287CB0
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 22:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRqFzR5uQkBR for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 22:36:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AC2AB87DE4
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 22:36:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id g9so5000539edr.8
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GvwSKpaoA5x+DSqsB+f1AMPpFVRxKHKEv8uKqvEucYw=;
 b=Fgom0UCJlXX6ZYR7ap+K4eVw6kw8QxPm179ZYKb9zJL1ujJpwqE+yUcYYVKhISNCKw
 eUIQaWUe3fIt6OpRVq9Ow1v3BRUVMxeFwBNOWlT0rnL7AS49gmO9Xw4h9OIl14fCirK2
 FQfW+BFCJLJPRy4aHwTKnMRM5TTXt/qv0UQQUPJGmlDDAZpWofyqRgko5igoobKJyV38
 +5ZHqbzjGWZC3YPOjJ33hygbzTUqyIEtsYXE14kO8S9yd8eSNWi4I3wXOHKUlX2Fo1Pt
 U3ogH66IRdy/zoRJoFEk8/rEbmVKMP4ECMXL7fpIBt6nYq2jYm69D7ABBcGcbPCGGfLT
 RbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GvwSKpaoA5x+DSqsB+f1AMPpFVRxKHKEv8uKqvEucYw=;
 b=Cywyu5bynWGmHkPnIGc4C6R7c3SAgxE+/lpnTOffFkVrnfNDccXb5GWoL27SkbfCz3
 Df5gypSCvXwgDBvBMbW5DHVCybozkz6VeVzFGRyo+YlNwTgw1R40FupAqoeU+5HODAsh
 e75AE9z3E/IBI11s5MFiAY3MVysGHBRJ6Gkt9XAMEnuqvvV7iAv9XZub9Ym2f5lAAoKC
 ZwvB55pO3zm8Hs8d4SGywzM4eOzBUQZral45lLDXsDV+sKStDFQ1JXDmIg6DrVPHw4j2
 JespE3HArE3VjVjebka1JNkmDprhU+wBJRGgrJIkzy2x5LcLe6ssLOCIyHNtQIhI+0mu
 78XA==
X-Gm-Message-State: AOAM530uKT2AJ0jbxyHOH34yRABtOtEcc8Ck6t1EA/QlnoHtNeK8SKNp
 FP8p5ElEbeoIPWfQLH7D82Q+RkUNaB9DNddbrfdxyw==
X-Google-Smtp-Source: ABdhPJy8SxNT7xctFY/cpsgQsvbHUXb6kaGpLDboGiOV9UTKzcQNszwcdpuF74K9ew+mqEwKaaO+9CyvU7oVeY7VHro=
X-Received: by 2002:a50:c2d9:: with SMTP id u25mr5738913edf.123.1590014188051; 
 Wed, 20 May 2020 15:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200519203419.12369-1-james.quinlan@broadcom.com>
 <20200519203419.12369-10-james.quinlan@broadcom.com>
 <20200520174216.GA11770@lst.de>
 <CA+-6iNzy_nELB0ptE0vH5KrGMFq4CctFKDipk3ZzXnjnT9hfuQ@mail.gmail.com>
In-Reply-To: <CA+-6iNzy_nELB0ptE0vH5KrGMFq4CctFKDipk3ZzXnjnT9hfuQ@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 20 May 2020 15:36:16 -0700
Message-ID: <CAPcyv4jOGE0F4wCFM+cC8g=SofiXaNCBfAEPumUv=7nCM6KJ6Q@mail.gmail.com>
Subject: Re: [PATCH 09/15] device core: Add ability to handle multiple dma
 offsets
To: Jim Quinlan <james.quinlan@broadcom.com>
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
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, May 20, 2020 at 11:27 AM Jim Quinlan <james.quinlan@broadcom.com> wrote:
>
> Sorry, I meant to put you on the to-list for all patches.   The last
> time I sent out this many patches using a collective cc-list for all
> patches I was told to reduce my cc-list.

You'd be forgiven. There are some developers that are ok to go read
the thread on something like lore if they are cc'd only a subset and
some that require the whole thread copied to them. Perhaps we need an
entry in MAINTAINERS that makes this preference discoverable? To date
I have been manually keeping track of those who want full threads and
those that would prefer to just be cc'd on the cover letter and the
one patch that directly affects their maintenance area.

Certainly blindly cc'ing everyone recommended by
scripts/get_maintainers.pl is overkill, but finding that subset is a
bit of an art.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
