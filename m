Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5E11BC80
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 20:07:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C042B84F12;
	Wed, 11 Dec 2019 19:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nx1xeSC62aC3; Wed, 11 Dec 2019 19:07:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E83E08582C;
	Wed, 11 Dec 2019 19:07:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC104C0881;
	Wed, 11 Dec 2019 19:07:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92261C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 19:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8101B84FA4
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 19:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQGBfKApccF1 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 19:07:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E81E684F12
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 19:07:38 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r27so848175otc.8
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hc42nBOfV8Wcb1mxtDsuyGJVG7qjP7ea1U94bkzCLiM=;
 b=lRaw71dW1nfaOP2hpcngw1LuuTldGurO3ijhNouCirvAZZvgaUUX92tsV6M8gwoCXl
 UjBotRIiZgFI7KDw3LAAL82B3ToPtE7MxYbuK8YKpfkSW1HnYQ6ixeMLYpxxK7WcoNQk
 3TxyjWzqcReztD1DEtJEMet5XQsat480SeBi+VY0sooS3bHz7UrcU5BFjfClZz6q050u
 1a0zNaTtxA6U2mbMVFyJEAfAeL4znfjrWYJ3cVzIl/US9sGeAD+y9zisHzYnqxEIHohp
 kcZ+pCel1fF2aZ2hCmqROqDn67WSN4io/nn//XsBh18KNOdAabOvLiZjgmjPALUCvMri
 w0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hc42nBOfV8Wcb1mxtDsuyGJVG7qjP7ea1U94bkzCLiM=;
 b=Au5zXViy+QzSCHDsQZNW2NJzrMX/kXYXfFS2ZR/S9UUV77ulxSarBdrO6QIt1gT9A0
 DwhfnCRqG8yGSF4be7tquzuQCF2K+gYAu2tY2Ld9KDa/FzuNTGvsMw5Ze9psf0EgG2iD
 ZFNbkNz4TNT9BrpWjcOoqbOpyCN7zrLHisPwrAliHgKeHtwLeWdphx+RhBE0AqqAAkil
 9PHZ71N1kL+Az98u/G37aN6kF09ahwgtLnR6iLgeDny6x+b6I992H0dbEGtdR0vgoMjm
 aqDiBhoM2vQRS0HMpY6tlPl+Oj9qszjrnGGnsxAaCPQiDEXBb8f1swjZAM1rTT4RaciM
 ySnQ==
X-Gm-Message-State: APjAAAVywv7OUJJZN+EVD4HUUD7bkXIvXDmxMvH6kj50lWAVFMPf02CN
 rTbMZIIqHPfu0H/heJJR6Po=
X-Google-Smtp-Source: APXvYqx5vEQQ0z8V60IbHxz8yo2rPss5wv9fE4Liofa+RQG8EZxeDcFYaagvcA1rndPYH3Ys+DbqRg==
X-Received: by 2002:a9d:175:: with SMTP id 108mr3406815otu.325.1576091257483; 
 Wed, 11 Dec 2019 11:07:37 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b15sm1175034oti.23.2019.12.11.11.07.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Dec 2019 11:07:37 -0800 (PST)
Date: Wed, 11 Dec 2019 12:07:35 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/dma: Rationalise types for DMA masks
Message-ID: <20191211190735.GA5609@ubuntu-m2-xlarge-x86>
References: <00d1ddf9439a8c79fb561b0fc740bddf9e6fe6b1.1576089015.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00d1ddf9439a8c79fb561b0fc740bddf9e6fe6b1.1576089015.git.robin.murphy@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: arnd@arndb.de, stephan@gerhold.net, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, hch@lst.de, nsaenzjulienne@suse.de
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

On Wed, Dec 11, 2019 at 06:33:26PM +0000, Robin Murphy wrote:
> Since iommu_dma_alloc_iova() combines incoming masks with the u64 bus
> limit, it makes more sense to pass them around in their native u64
> rather than converting to dma_addr_t early. Do that, and resolve the
> remaining type discrepancy against the domain geometry with a cheeky
> cast to keep things simple.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
