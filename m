Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F38C315728
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 20:50:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E744868E3;
	Tue,  9 Feb 2021 19:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9O-uDf1m17yB; Tue,  9 Feb 2021 19:50:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77028868B6;
	Tue,  9 Feb 2021 19:50:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B1FEC013A;
	Tue,  9 Feb 2021 19:50:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77319C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 19:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 713F086884
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 19:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dvEMflanDNM for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 19:49:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1943E8687A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 19:49:53 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id i3so9844781oif.1
 for <iommu@lists.linux-foundation.org>; Tue, 09 Feb 2021 11:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NgzDc0kNuzf06Hxn7V9rhAXM0YLGjx8dhHymSQgrgMs=;
 b=aPgHQWeq7S7g6zpwZuPZBdAo5mEaX4rgWJh9iYZ2UCHrAn39gG7xHt0q/lKZA/rqiz
 5D0Yj7lylUSXrB1XOd8QVvSNbqxQ8juLaFCTu+fpB9Kg/geLi/8uyw7IQ3kWQ9MJkM6w
 nnP88CS+S+4LapOkgAdBPMKLnvgKgcgEPNIT821Xu+/ZA75ojQNsUeoR1RzljXoPIOBi
 CLyTPbHyRCQpYAHpxfCaSjd/ZDhEJ3wRjtqzdpeGp4pBdkWAc3eXHqkpPXzIS4F4QS0X
 FNLcskTJEhoykYh7ytma7/rRQZKDCdawh4Lt7GY8f1QGJwfE2/4079zYjITFPVKLA/33
 lgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NgzDc0kNuzf06Hxn7V9rhAXM0YLGjx8dhHymSQgrgMs=;
 b=WJTlidr46Wu36LqQS2goDdl5oIi0wjZ3qHv0W8uCscbFGrLGteezBbPTk1kTwr6m6z
 W0wYk/WJwJ8dqRjouuNZgOQ+W5vsYltSu3IvpA6dWADzTJZB8KEqJmLV+arC2B0EiK/O
 nTNkE1wFMNyiUK1ELT5jBUcpaD11I8ovr06y53hpSfKQuUrBxEiZFtc2AjhcIzfkuKru
 aT3KcTYxA64kE/U8JuGyedTyHb6og6lw5ZO+fkHV2rhrAs4x4REQ+KIIC2pvJmhtAlBN
 /9AOR8KgKu/3IrY7YqdDwvg0/ph8Ax8AGX9HPWu4JDC+TAY2fq3Z1ijuLTl5hJ84BfFm
 abjA==
X-Gm-Message-State: AOAM533/29fMrJmRg8nEc8hakJcutO+uEBF3MmtgT8IwbbrlMhiOf1Uz
 6FUXKTEq3XcF8rSpusAenGfEHO2gsAo/AwRu1dpteg==
X-Google-Smtp-Source: ABdhPJwpfdKffypmc946sN/rrdalCnQadGovpvCLJqk+wgm0R4o6oZTVVk3Vi/zVpQlVPUpdAnbJB/5+oJLRSk6Kfj8=
X-Received: by 2002:a05:6808:21a:: with SMTP id
 l26mr3500947oie.42.1612900192109; 
 Tue, 09 Feb 2021 11:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20210207160327.2955490-1-hch@lst.de>
 <20210209084156.GA32320@lst.de>
In-Reply-To: <20210209084156.GA32320@lst.de>
Date: Tue, 9 Feb 2021 11:49:40 -0800
Message-ID: <CAMGD6P2QiQba=49LMOsQNZ=U9+hmAjxYLwroZGAG_AXoatUYpg@mail.gmail.com>
Subject: Re: preserve DMA offsets when using swiotlb v2
To: Christoph Hellwig <hch@lst.de>
Cc: Saravana Kannan <saravanak@google.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marc Orr <marcorr@google.com>,
 gregkh@linuxfoundation.org, linux-nvme@lists.infradead.org,
 iommu@lists.linux-foundation.org, Keith Busch <kbusch@kernel.org>,
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
From: Jianxiong Gao via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jianxiong Gao <jxgao@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> Sorry for being a little pushy, any chance we could get this reviewed
> in time for the 5.12 merge window?
>
Tested and it looks good. Thanks for clearing it up!

Gao
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
