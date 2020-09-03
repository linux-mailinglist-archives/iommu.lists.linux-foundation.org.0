Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3725B88A
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 04:03:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F2A386B82;
	Thu,  3 Sep 2020 02:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9P4x9d3a5uF; Thu,  3 Sep 2020 02:03:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C470C86B7E;
	Thu,  3 Sep 2020 02:03:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD06AC0051;
	Thu,  3 Sep 2020 02:03:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FA21C0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 02:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 358E186AE1
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 02:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkkIl53IdDNL for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 02:03:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5DB2886AD8
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 02:03:00 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t7so859865ljo.13
 for <iommu@lists.linux-foundation.org>; Wed, 02 Sep 2020 19:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0hhuuiXUXPKShiC2Hls0S5u+97zhlA3Lfy3FSwPZAvg=;
 b=MBUm6X2YTxoMrNEsmsd3ByNMySLkQvEH9s/fpLDT25i27Qzys1GNTUlZM5s8aDj8mo
 EqbWsiYrK41/1h7pE3vshEiq3zac+0m5Iw8AtlZV+UFOB1vMg2K6ukwyT9LBbKbzM4db
 Jgji/OQ9Z8TsGHrNvZMPNEyJ+vni7HtYdMpWBOEyZOlJrqR+TAawkYGdlo7m/Byi6vE/
 fDBMjBCwDFNbgq8DPZI8gscsPu6AT7J0XQoX4jMVhJLBYmRZRnTitm2OxSHEXgBZ567n
 Jtl3jhGFgMBh/7jclUPPjFKYPQpQTHifZNq4BZ7Yt1Gu8T26YPAK76w2QTUHjxYNViIE
 uXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hhuuiXUXPKShiC2Hls0S5u+97zhlA3Lfy3FSwPZAvg=;
 b=M5M1GHnMNnLly5Vr3P48VxEagtKB64NAkXzMKEnBBJ9CzDF/Js2RlYNibp9sFhfcyv
 i7b5XW3WueCAVOVdcigCXkEptkmvgCVh2U5kl6sFjLZNDeA3zYFIKIKoxEiYRBLmrYE+
 Ba+26+6cRHaDr5/oAJ0VPrc++KMC0BHp8upEQ7NeL9R8fwEKJRn7+Fnkc0nrjgy6uYIU
 ReNOT4FOBCn2N7t71jV8gwIlgRRo6kAC3Cm++dyeanOO8gN4v9efr9gpBJMqPUob0d80
 d36YSdrKMlAYW+0vlbjNSl02Mo9ysblBk8ywAhzPjykGQoKT+puTsnLf4aZiKEznDrGZ
 TV4g==
X-Gm-Message-State: AOAM533QdgbMX5EBQOIAhvtsie0+2CNulaVtokvbrBhPw7RFUol71YVH
 D6wC6BUVPJF6RUTNd9gFxCx5vTzeLGkr0X8V98o=
X-Google-Smtp-Source: ABdhPJzNoSz8uY8UPgeA6q7FOXakXQ+iiBNWwUG+0sQjrda+2kn2J/WiiHYxLFnj8lC2PzmhToR6/lB1iKnoP7+eT3Y=
X-Received: by 2002:a2e:9047:: with SMTP id n7mr433249ljg.125.1599098578210;
 Wed, 02 Sep 2020 19:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200902173105.38293-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200902173105.38293-1-andriy.shevchenko@linux.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Sep 2020 23:02:46 -0300
Message-ID: <CAOMZO5CMBer5VBWz0ruUUtVM9V4p0bYaTnV_bJnrORzug2=0Aw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] swiotlb: Use %pa to print phys_addr_t variables
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-pci@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Sep 2, 2020 at 2:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is an extension to a %p to print phys_addr_t type of variables.
> Use it here.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: dropped bytes replacement (Fabio)

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
