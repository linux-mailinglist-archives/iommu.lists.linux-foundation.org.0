Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA64469A65
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 16:04:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6D554033F;
	Mon,  6 Dec 2021 15:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtZEW99Ng4gu; Mon,  6 Dec 2021 15:04:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C48124045C;
	Mon,  6 Dec 2021 15:04:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CC71C0071;
	Mon,  6 Dec 2021 15:04:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7083CC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 15:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FBCC81A95
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 15:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6U0FUzdF5pK for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 15:04:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C81E81A6F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 15:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdEZ3iIvyMGOLiKjYacwELa555tAsw9w+TMO7NmMmNs1TScbAe4WPOcxE3LOTirIjNtqrcZ6xBsNBCJUt8FISre3sdFjxebEEIAvNsYTYu1huU7vKY8P19gKxhYIR+sqYEWRsAqOecx6O+X1Riy0XXZ7jmE4vc4rfoufrTOi3wOJvStFk1cmLh7KyRnRNe4rjRGMe/MlY/bKo9Kz9EkKqS/ApNw3JalN/MwKldsg6/lakUHur8UqPEha9AtF6hDIzRvzSKs092sypKd+OF6q12+QKsn2hudyZAHrn+tXznEDR93SJnErZEHcpPFdJwoRfTsHmZRi0mhl2fPfk0+xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtZFuEmzZMCVgISoONtilz3JjVgvW8i392U/nyQ9GvE=;
 b=JEQiBGlyjfTcYQfQVifTjf5excEsU9ym3ZgliJi8NFsANfKYrJmQg8dsSn2I6M89oiL7JVkvc/BN3cyDB7jLSjjKJTLzLSZkc2hiCvxvKQX6Aadz4E5TKPwJ1Z4jTj3HAINrVkeb5WhBxq8GcVxTAi9c3ZiG35VI7Jx8lChXEVYluoabls2UnvmpkbISuR6rTlSWtZCzRxrAl8snr/eEzg11VLoBhebqj5pYKuYEGI5EROPj8CtXzNB7vcsPNbHgkXUMmrINZMBpNEYKN+rVefr/56sMbmJvhSd9BuxFehZhDLjPX5I57rAsp3MuqzKSUPGjH/uB6ByUhHH9YAZYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtZFuEmzZMCVgISoONtilz3JjVgvW8i392U/nyQ9GvE=;
 b=k5p5nO4UbTAHE/QBNwnvw1BP41pW8i1NygqdeDdRTSd30sKdeQPJjUSeVa1NtRQJ8C1u2R0SzhRDSnDVEdy3EY3OfzRhxEz+WHgvQwbBjceSuFbIv9M5iVEDuziF3tsoclfcLMD1WdOIvb+YGLg4JUx6vWtxOMulI0jqgcSujNVVurMPFdvpdcsI4akPiqsn3wNJoGlvsHjdb76qm9gFRJoacBL+L0fUY8Sr+2FqK60cu6OS+KM0JtMQhfpFn4SAIp/Lla0iziUKhgrFhLwY2jknaVmvjSvgRjuvXwmN9z+IkWMpZDmjaL/HHM4yf5i0YLyY8w9GqSFeUxfGtm/krQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5539.namprd12.prod.outlook.com (2603:10b6:208:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 15:04:17 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%5]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 15:04:17 +0000
Date: Mon, 6 Dec 2021 11:04:15 -0400
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 03/18] driver core: platform: Rename
 platform_dma_configure()
Message-ID: <20211206150415.GD4670@nvidia.com>
References: <20211206015903.88687-1-baolu.lu@linux.intel.com>
 <20211206015903.88687-4-baolu.lu@linux.intel.com>
 <Ya3BYxrgkNK3kbGI@kroah.com> <Ya4abbx5M31LYd3N@infradead.org>
 <20211206144535.GB4670@nvidia.com> <Ya4ikRpenoQPXfML@infradead.org>
Content-Disposition: inline
In-Reply-To: <Ya4ikRpenoQPXfML@infradead.org>
X-ClientProxiedBy: BL0PR1501CA0017.namprd15.prod.outlook.com
 (2603:10b6:207:17::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR1501CA0017.namprd15.prod.outlook.com (2603:10b6:207:17::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 15:04:16 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1muFXL-008x41-Ry; Mon, 06 Dec 2021 11:04:15 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3f94b43-9e98-4466-2753-08d9b8c9ac37
X-MS-TrafficTypeDiagnostic: BL0PR12MB5539:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5539CEB86226B65AC92796C5C26D9@BL0PR12MB5539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7AlWs9amc84JbdYogmSt99EVwGnmIkEV4tZESyAa6wpSdQ1ueloBHr5gNVWWPezSf9XKjbAgHUqEcsYHkLQ6A62mK3nPuIVJs8o0niqI9m8X/WEHNM/L5c3V1p/J3raZqdZN7YWm+Te2/3jIPUsZ+S6eQD0otpaz/DsKtrNMZMZzub/Ydecux8rLDekSv6xoiU8FHrXzNL9e7RJS6hqmMzWQ0ZRL7YTisXL1jE6k+CUhsF5rN5m8dRgscRXDlDZXgLKMvEWnvl3lUw5rEUIOlfw7w1UvN9lXy+RLCyp3GzvNR29yynLDrTebwjw8dGHN1NnpIUuu+ZiL3k7z1KFi6jPGIwNusdwR+3WHkL2rQwS0kmd3Ofpj+8ENF/oxlkRPsL/paSe6y9bRhwzTNPiFRVGpbvEtuvf0pLzmPgSoVipejiLrZenST/gTmRt+LC9uAQCI2gi+GUBgHWbpMWgxNKCULZTMvpF7JTmiqZQR/iDO34K0yVzu0AkphmgV8lL6WVniQUVo64jVXHTMbDJkZVlyMAGcc3HAiBTJViFb67erewneTH3Ofcr75WEeZyd/9tsCuV8Z5QuoJoiGi6q4L+tRdigsZN/kjaaMYzQfapm77qu0FxuNjPTZDHg004d22gQwOCGdQFqnEzYsumpkTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(8936002)(4326008)(7416002)(54906003)(26005)(316002)(9786002)(6916009)(1076003)(66476007)(66556008)(86362001)(4744005)(508600001)(2906002)(36756003)(426003)(186003)(2616005)(38100700002)(33656002)(66946007)(5660300002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wz981IQHcmE3qe40G09+HOF1+ReCjSdPgYuszb7xFAbxIG/xf1xnEfLdKo/G?=
 =?us-ascii?Q?ebbLgZJv3ZVReGa+SMZ1uNmlDHokb6qQ982Yf9eg6jmASlDKTJGKcN9huK5z?=
 =?us-ascii?Q?yYxk2Pazb4kD9p9QyGAjP59sTpa3OzbRMTar0VNEIAkPLtetHHx+/jSidyj0?=
 =?us-ascii?Q?h5gozntb9nrwY6mq+e3Rk149RnK94xcC/5WGOwBSdiO5mlq7lBJMfYMbcaMU?=
 =?us-ascii?Q?VrIcE55qziydWFSVSJYA0reaagXD2l33X1njIAv002ocML0y2FG5fF6lvYuv?=
 =?us-ascii?Q?ES/W1Hzm+y3uiZ4vim0KeNX36ihgfI6j4HhqXiNz72bGGpdBOM/iQiIzEsh6?=
 =?us-ascii?Q?r8/l4zckMLN/7f4r64WBIPoTu8pVAld6uF3Lifcjhb++75GqmVS4qkVfPa8n?=
 =?us-ascii?Q?YE9iu2NHsYVXAuDjfVUHg2YshwISyK/cTJvulaSSuThSVsJnwYFoTV7XhOBw?=
 =?us-ascii?Q?LOGpi2UkvoawhtvhSaBxWT+q9RVn6/N9FEgowE+C3rut4P9EskBxWTMnWlcM?=
 =?us-ascii?Q?lvGdmXd56lMbWt0Vakj+1Qu7TR9aoqNJBqUfhTNCdAYv9Zf2WvOkyJcD/BUo?=
 =?us-ascii?Q?L6gQLyc+ywKs5yxPSwzwTSq4TuH3p3eLKPjjXjw21xSm54GIliFoCrFunYUs?=
 =?us-ascii?Q?BKMlKBmqVz3StyNS+vfvaUjtHBoea9pO3i7lBTYI7tIN7WnLaJYa3ViCbfrE?=
 =?us-ascii?Q?Rr+z2PnSudYBvx3wpyyDTBSFZhVW336HLgyL+NCR/pUUUtntAwQ3ZX8SUQba?=
 =?us-ascii?Q?/KhevkRNmR4f4ZCvxmy4AzaYj06F2GU8KMqyoJuE0fvcKDRGTa5ueh+Zdfwf?=
 =?us-ascii?Q?IrkPJ2COoifDYAdCX+HrzObnA9b28b7SPlbAJD3q8MH+w266Q3rI+13pY7ll?=
 =?us-ascii?Q?rSk8R5C8QGWNo6N266OAp5sA7A2N6WRyrhaMxfomLrgsInKFdT6dJ2mOIKxm?=
 =?us-ascii?Q?ddV4HMmdH6kBNsf3hssQsxqOID9khSoah7vEZHCdWGPoEdgHbyHbR2IuhGKN?=
 =?us-ascii?Q?Yjo9UHiFia7885S8r4K5wElFEOGN2yTkIA+9zFUCwy/e7mUJunu4Pp67fNjF?=
 =?us-ascii?Q?/BsA8E/JQ8puxHvqZoWOAu5kHC9+0d8MS89/ue0RFrVjAfFx0Ts4VnbxGEuR?=
 =?us-ascii?Q?zhKkJ3OsMEXV7UCKgB1MDiEQVqpL27zE2M35O/Hi3JsJRWLdxp+shw/J9Uop?=
 =?us-ascii?Q?Lpmizkh7KqthS1mt8xNkk/pMfbxBCUFtNuWjZVzmG4qtVsm1m09Mwqt+8XyY?=
 =?us-ascii?Q?GgjgoU5MMt0fC634nKf9xa2KO55dNg5mSjfBVWnG8ELhPsw4jomJsCPu16Nv?=
 =?us-ascii?Q?G/WtINOWtVCHoncce5ca03q9U/PYZxV1r+eJQtb9xUDdrQH221a6lmyxUmT7?=
 =?us-ascii?Q?U2+G0nQ3tcOwov2mlq8uqrpL91eJGGHwyOiE3rrjnOBVR8pf1DF4C+sfeWin?=
 =?us-ascii?Q?5vqPEe41B4BKzdTvT1qeewn0HOwHhvdldh9wkkFIjrS6uT02DxaZO/bxRt9N?=
 =?us-ascii?Q?yVWXndzfTWldI9PRCGaCFEAWAKG4xPfqAK2raxDRGql8iqORG/rnPiQyFFJm?=
 =?us-ascii?Q?2lKtW1OBpF1RDOnKffc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f94b43-9e98-4466-2753-08d9b8c9ac37
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 15:04:16.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkaCSUCTJ14osS4oFFs0ls5R3q0vnwLB8QXdSITAVigzr0nSq/S1k6s3CVkkAqaT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5539
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Dec 06, 2021 at 06:47:45AM -0800, Christoph Hellwig wrote:
> On Mon, Dec 06, 2021 at 10:45:35AM -0400, Jason Gunthorpe via iommu wrote:
> > IIRC the only thing this function does is touch ACPI and OF stuff?
> > Isn't that firmware?
> > 
> > AFAICT amba uses this because AMBA devices might be linked to DT
> > descriptions?
> 
> But DT descriptions aren't firmware.  They are usually either passed onb
> the bootloader or in some deeply embedded setups embedded into the
> kernel image.

Pedenatically yes, but do you know of a common word to refer to both
OF and ACPI that is better than firmware? :)

AFAICT we already use firwmare for this in a few places, eg
fwnode_handle and so on.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
